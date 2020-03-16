from colored import attr, fg, stylize
from utils.AddressMap import AddressMap
from utils.Executable import Executable
from utils.Report import Report

class Campaign(object):
    """
    Represents an injection campaign
    Provides an implementation that will inject every instruction with all
    single-flipped-bit bitmasks possible.

    Arguments:
    pathToExecutable -- path to the (instrumented) executable to be analyzed
    pathToMap -- path to instruction address .map file
    """
    def __init__(self, pathToExecutable, pathToMap):
        self._executable = Executable(pathToExecutable)
        self._map = AddressMap(pathToMap)
        self._report = Report("report.log")

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))
        print(stylize("Getting golden output...", fg("yellow")))
        golden = self._executable.run_golden()
        print(golden)
        self._report.add_golden(golden)
        print(stylize("Starting injection", fg("blue")))

        for instr in self._map:
            print(fg("white"), attr("bold"), "Injecting:\t", instr.text, attr("reset"))
            for i in range(32):
                mask = self._get_bit_mask(i)
                result = self._executable.run_injection(instr.address, mask)
                print("Mask: ", hex(mask), "\t", result)
                self._report.add_run(instr, mask, result)

        self._report.write_report()

    def _get_bit_mask(self, i):
        return (1 << i)
