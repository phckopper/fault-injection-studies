from time import time
from colored import attr, fg, stylize
from utils.AddressMap import AddressMap
from utils.Executable import Executable, ExecutionCrashed, ExecutionHanged
from utils.Report import Report

class Campaign(object):
    """
    Represents an injection campaign
    Provides an implementation that will inject every instruction with all
    single-flipped-bit bitmasks possible.

    Arguments:
    pathToExecutable -- path to the (instrumented) executable to be analyzed
    pathToMap -- path to instruction address .map file
    timeoutTolerance -- how many times slower should the run be to be considered a hang
    """
    def __init__(self, pathToExecutable, pathToMap, timeoutTolerance=5):
        self._executable = Executable(pathToExecutable)
        self._map = AddressMap(pathToMap)
        self._report = Report("report.log")
        self._tolerance = timeoutTolerance

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))

        print(stylize("Getting golden output...", fg("yellow")))
        _start_time = time()
        golden = self._executable.run_golden()
        golden_time = (time() - _start_time) * self._tolerance
        print(golden, golden_time)
        self._report.add_golden(golden)

        print(stylize("Starting injection", fg("blue")))

        for instr in self._map:
            print(fg("white"), attr("bold"), "Injecting:\t", instr.text, attr("reset"))
            for i in range(instr.width):
                mask = self._get_bit_mask(i)
                try:
                    result = self._executable.run_injection(instr.address, mask, golden_time)
                    print("Mask: ", hex(mask), "\t", result)
                    self._report.add_run(instr, mask, result=result)
                except ExecutionHanged:
                    print("Mask: ", hex(mask), fg("red"), "HANGED", attr("reset"))
                    self._report.add_run(instr, mask, hanged=True)
                except ExecutionCrashed:
                    print("Mask: ", hex(mask), fg("red"), "CRASHED", attr("reset"))
                    self._report.add_run(instr, mask, crashed=True)

        self._report.write_report()

    def _get_bit_mask(self, i):
        return (1 << i)
