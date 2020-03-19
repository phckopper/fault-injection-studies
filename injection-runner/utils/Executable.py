import subprocess

class ExecutionHanged(Exception):
    pass

class Executable(object):
    """
    Represents the executable to be injected during a campaing

    Arguments:
    pathToExecutable -- string path to executable
    """
    def __init__(self, pathToExecutable):
        self._pathToExecutable = pathToExecutable

    """ Gets the executable golden output """
    def run_golden(self):
        output = subprocess.run(self._pathToExecutable, capture_output=True)
        return output.stdout

    """
    Runs the executable injecting a given mask at a given address

    Arguments:
    address -- address of the instruction to be injected (given by the .map file)
    mask -- binary mask to be XORed with the original return value of the instruction
    timeout -- timeout for the executable
    """
    def run_injection(self, address, mask=1, timeout=0):
        env = dict(INJECTION_ADDR=str(address), INJECTION_MASK=str(mask))
        try:
            output = subprocess.run(self._pathToExecutable, capture_output=True, env=env, timeout=timeout)
            return output.stdout
        except subprocess.TimeoutExpired:
            raise ExecutionHanged
