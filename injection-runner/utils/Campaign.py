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
        self._campaign = self._report.start_campaign()

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
        instr_db = self._report.add_instruction(instr.address, instr.width, instr.text)
        runs = []

        for i in range(instr.width):
            mask = self._get_bit_mask(i)
            hanged = False
            crashed = False
            result = b""
            try:
                result = self._executable.run_injection(instr.address, mask, self.golden_time)
                #print("Mask: ", hex(mask), "\t", result)
            except ExecutionHanged:
                #print("Mask: ", hex(mask), fg("red"), "HANGED", attr("reset"))
                hanged = True
            except ExecutionCrashed:
                #print("Mask: ", hex(mask), fg("red"), "CRASHED", attr("reset"))
                crashed = True
            finally:
                r = dict(mask=hex(mask), result=result.decode("utf-8"), hanged=hanged, 
                         crashed=crashed, campaign=self._campaign, instruction=instr_db)
                runs.append(r)
        self._report.add_runs(runs)

    def _get_bit_mask(self, i):
        return (1 << i)
