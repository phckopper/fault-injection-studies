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
    def __init__(self, base, name, version):
        self._base = base
        self._name = name
        self._version = version
        self._path = "{}/instr/{}_{}_instr".format(base, name, version)

    """ Gets the executable golden output """
    def run_golden(self, n):
        env = dict(INJECTION_ADDR=str(sys.maxsize))
        output = subprocess.run([self._path, self._get_test_vector(n),
                                 self._get_output_file("golden", n)], stdout=subprocess.PIPE, env=env)
        return output.stdout

    """
    Runs the executable injecting a given mask at a given address

    Arguments:
    address -- address of the instruction to be injected (given by the .map file)
    timeout -- timeout for the executable
    """
    def run_injection(self, address, n, timeout=0):
        env = dict(INJECTION_ADDR=str(address))
        try:
            output = subprocess.run([self._path, self._get_test_vector(n), self._get_output_file(address, n)],
                                    stdout=subprocess.PIPE, env=env, timeout=timeout, check=True)
            return output.stdout
        except subprocess.TimeoutExpired as e:
            raise ExecutionHanged
        except subprocess.CalledProcessError as e:
            if e.returncode < 0:
                # TODO: differentiate between signals
                raise ExecutionCrashed

    def _get_test_vector(self, n):
        return "{}/{}/Test Vectors/testVec{}.txt".format(self._base, self._name, n)

    def _get_output_file(self, address, n):
        return "{}/results/{}/{}-{}.out".format(self._base, self._version, n, address)

