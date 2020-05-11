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
    def __init__(self, pathToExecutable, args):
        self._pathToExecutable = pathToExecutable
        self.args = args

    """ Gets the executable golden output """
    def run_golden(self):
        env = dict(INJECTION_ADDR=str(sys.maxsize))
        output = subprocess.run([self._pathToExecutable]+self.args+["./outputs/golden.out"], stdout=subprocess.PIPE, env=env)
        return output.stdout

    """
    Runs the executable injecting a given mask at a given address

    Arguments:
    address -- address of the instruction to be injected (given by the .map file)
    timeout -- timeout for the executable
    """
    def run_injection(self, address, timeout=0):
        env = dict(INJECTION_ADDR=str(address))
        try:
            output = subprocess.run([self._pathToExecutable]+self.args+[self._get_output_file(address)], 
                                    stdout=subprocess.PIPE, env=env, timeout=timeout, check=True)
            return output.stdout
        except subprocess.TimeoutExpired as e:
            raise ExecutionHanged
        except subprocess.CalledProcessError as e:
            if e.returncode < 0:
                # TODO: differentiate between signals
                raise ExecutionCrashed

    def _get_output_file(self, address):
        return "./outputs/{}.out".format(address)

