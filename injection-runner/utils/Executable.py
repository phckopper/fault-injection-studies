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
    base -- base folder of the binary to be injected (must conform to structure)
    name -- name of the binary to be injected
    """
    def __init__(self, base, name):
        self._base = base
        self._name = name

    """ Gets the executable golden output """
    def run_golden(self, vector):
        env = dict(INJECTION_ADDR=str(sys.maxsize))
        vec = self._get_vector_path(vector)
        output = subprocess.run([self._base + self._name, vec,
                                 self._get_output_file("golden", 0, 0, vector)],
                                 stdout=subprocess.PIPE, env=env)
        return output.stdout

    """
    Runs the executable injecting a given mask at a given address

    Arguments:
    address -- address of the instruction to be injected (given by the .map file)
    timeout -- timeout for the executable
    """
    def run_injection(self, address, mask, _iter, vector, timeout=5):
        env = dict(INJECTION_ADDR=str(address), INJECTION_MASK=str(mask),
                   INJECTION_CNT=str(_iter))
        vec = self._get_vector_path(vector)
        try:
            output = subprocess.run([self._base + self._name, vec,
                                     self._get_output_file(address, mask, _iter, vector)],
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

    def run_profiling(self, vector):
        env = dict(INJECTION_ADDR=str(sys.maxsize), INJECTION_PROF="1")
        vec = self._get_vector_path(vector)
        output = subprocess.run([self._base + "/" + self._name, vec,
                                 self._get_output_file("profile", 0, 0, vector)],
                                 stdout=subprocess.PIPE, env=env)
        return output.stdout

    def _get_vector_path(self, vector):
        return "{}Test Vectors/testVec{}.txt".format(self._base, vector)

    def _get_output_file(self, address, mask, _iter, vector):
        out = "{}outputs/{}-{}-{}-{}.out".format(self._base, address, vector, hex(mask), _iter)
        return out

