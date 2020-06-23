import subprocess
import sys

class ExecutionHanged(Exception):
    pass

class ExecutionCrashed(Exception):
    pass

class Executable(object):
    """
    Represents the executable to be injected during a campaing

    Arguments:
    pathToExecutable -- string path to executable
    """
    def __init__(self, base, vector):
        self._base = base
        self._vector = vector

    """ Gets the executable golden output """
    def run_golden(self):
        env = dict(INJECTION_ADDR=str(sys.maxsize))
        output = subprocess.run([self._base, self._vector,
                                 self._get_output_file("golden", 0, 0)],
                                 stdout=subprocess.PIPE, env=env)
        return output.stdout

    """
    Runs the executable injecting a given mask at a given address

    Arguments:
    address -- address of the instruction to be injected (given by the .map file)
    timeout -- timeout for the executable
    """
    def run_injection(self, address, mask, _iter, timeout=5):
        env = dict(INJECTION_ADDR=str(address), INJECTION_MASK=str(mask),
                   INJECTION_CNT=str(_iter))
        try:
            output = subprocess.run([self._base, self._vector,
                                     self._get_output_file(address, mask, _iter)],
                                     stdout=subprocess.PIPE, env=env,
                                     timeout=timeout, check=True)
            print(output)
            return output.stdout
        except subprocess.TimeoutExpired as e:
            raise ExecutionHanged
        except subprocess.CalledProcessError as e:
            if e.returncode < 0:
                # TODO: differentiate between signals
                raise ExecutionCrashed

    def _get_output_file(self, address, mask, _iter):
        out = "results/{}-{}-{}.out".format(address, hex(mask), _iter)
        print(out)
        return out

