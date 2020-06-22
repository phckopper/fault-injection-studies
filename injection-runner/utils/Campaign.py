from concurrent.futures import ThreadPoolExecutor
from random import choice, randint
from time import time
from colored import attr, fg, stylize
from utils.Executable import Executable, ExecutionCrashed, ExecutionHanged
from utils.AddressMap import AddressMap
from utils.Report import Report

class Campaign(object):
    """
    Represents an injection campaign
    Provides an implementation that will inject every instruction with all
    single-flipped-bit bitmasks possible.

    Arguments:
    executable --
    profile --
    timeoutTolerance -- how many times slower should the run be to be considered a hang
    threads -- how many threads to include in pool
    """
    def __init__(self, executable, addressMap, testVec, timeoutTolerance=5, threads=2, nSamples=50):
        self._map = AddressMap(addressMap)
        self._exec = Executable(executable, testVec)
        print(addressMap, executable, testVec)
        self._report = Report("report.log")
        self._nSamples = nSamples
        self._timeout = timeoutTolerance
        self._threads = threads

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))
        self._campaign = self._report.start_campaign()


        print(stylize("Starting injection", fg("blue")))

        with ThreadPoolExecutor(max_workers=self._threads) as pool:
            for instr in self._map:
                if instr.width == 0:
                    instr.width = 32
                instr_db = self._report.add_instruction(instr.address, instr.text,
                                             instr.width, instr.iters)
                print(fg("green"), attr("bold"), "Now injecting ", instr.text, attr("reset"))
                for _ in range(self._nSamples):
                    _iter = randint(0, instr.iters)
                    _mask = (1 << randint(0, instr.width - 1))
                    pool.submit(self._inject_instruction, instr.address, _mask, _iter)
        pool.shutdown()

    def _inject_instruction(self, addr, mask, _iter):
        print(fg("white"), attr("bold"), "Injecting:\t", addr, " mask ", mask, attr("reset"))

        hanged = False
        crashed = False
        result = b""
        try:
            result = self._exec.run_injection(addr, mask, _iter, self._timeout)
        except ExecutionHanged:
            print(fg("red"), "HANGED", attr("reset"))
            hanged = True
        except ExecutionCrashed:
            print(fg("red"), "CRASHED", attr("reset"))
            crashed = True
        except Exception as e:
            print(e)
            raise e
        finally:
            r = dict(result=result.decode("utf-8"), hanged=hanged, 
                     crashed=crashed, campaign=self._campaign)
        self._report.add_run(r)
