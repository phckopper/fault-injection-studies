from multiprocessing import Pool
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
        self._report.start_campaign()

        print(stylize("Getting golden output...", fg("yellow")))
        _start_time = time()
        self.golden = self._executable.run_golden()
        self.golden_time = (time() - _start_time) * self._tolerance
        print(self.golden, self.golden_time)
        self._report.add_golden(self.golden)

        print(stylize("Starting injection", fg("blue")))

        with Pool(processes=4) as pool:
            pool.map(self._inject_instruction, self._map)

    def _inject_instruction(self, instr):
        print(fg("white"), attr("bold"), "Injecting:\t", instr.text, attr("reset"))
        self._report.add_and_start_instruction(instr.address, instr.width, instr.text)
        for i in range(instr.width):
            mask = self._get_bit_mask(i)
            try:
                result = self._executable.run_injection(instr.address, mask, self.golden_time)
                print("Mask: ", hex(mask), "\t", result)
                self._report.add_run(mask, result=result)
            except ExecutionHanged:
                print("Mask: ", hex(mask), fg("red"), "HANGED", attr("reset"))
                self._report.add_run(mask, hanged=True)
            except ExecutionCrashed:
                print("Mask: ", hex(mask), fg("red"), "CRASHED", attr("reset"))
                self._report.add_run(mask, crashed=True)

    def _get_bit_mask(self, i):
        return (1 << i)
