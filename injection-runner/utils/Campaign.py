from multiprocessing import Pool
from random import sample
from time import time
from colored import attr, fg, stylize
from utils.Executable import Executable, ExecutionCrashed, ExecutionHanged
from utils.Report import Report

class Campaign(object):
    """
    Represents an injection campaign
    Provides an implementation that will inject every instruction with all
    single-flipped-bit bitmasks possible.

    Arguments:
    pathToExecutable -- path to the (instrumented) executable to be analyzed
    nInstructions -- number of instructions ran without flaws
    timeoutTolerance -- how many times slower should the run be to be considered a hang
    threads -- how many threads to include in pool
    """
    def __init__(self, pathToExecutable, nInstructions, timeoutTolerance=5, threads=4, args=[], nSamples=300):
        self._executable = Executable(pathToExecutable, args)
        self._report = Report("report.log")
        self._nInstructions = nInstructions
        self._nSamples = nSamples
        self._timeout = timeoutTolerance
        self._threads = threads

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))
        self._campaign = self._report.start_campaign()

        print(stylize("Getting golden output...", fg("yellow")))
        _start_time = time()
        self.golden = self._executable.run_golden()
        self._report.add_golden(self.golden)

        print(stylize("Starting injection", fg("blue")))

        with Pool(processes=self._threads) as pool:
            pool.map(self._inject_instruction, sample(range(self._nInstructions), self._nSamples))

    def _inject_instruction(self, instr):
        print(fg("white"), attr("bold"), "Injecting:\t", instr, attr("reset"))

        hanged = False
        crashed = False
        result = b""
        try:
            result = self._executable.run_injection(instr, self._timeout)
        except ExecutionHanged:
            print(fg("red"), "HANGED", attr("reset"))
            hanged = True
        except ExecutionCrashed:
            print(fg("red"), "CRASHED", attr("reset"))
            crashed = True
        finally:
            r = dict(result=result.decode("utf-8"), hanged=hanged, 
                     crashed=crashed, campaign=self._campaign)
        self._report.add_run(r)
