from concurrent.futures import ThreadPoolExecutor
from random import choice 
from time import time
from colored import attr, fg, stylize
from utils.Executable import Executable, ExecutionCrashed, ExecutionHanged
from utils.Profile import Profile
from utils.Report import Report

class Campaign(object):
    """
    Represents an injection campaign
    Provides an implementation that will inject every instruction with all
    single-flipped-bit bitmasks possible.

    Arguments:
    base --
    name --
    timeoutTolerance -- how many times slower should the run be to be considered a hang
    threads -- how many threads to include in pool
    """
    def __init__(self, base, name, timeoutTolerance=5, threads=2, nSamples=385):
        self._profile = Profile(base)
        self._base = base
        self._name = name
        self._report = Report("report.log")
        self._nSamples = nSamples
        self._timeout = timeoutTolerance
        self._threads = threads

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))
        self._campaign = self._report.start_campaign()


        print(stylize("Starting injection", fg("blue")))
        profile = self._profile.load()

        with ThreadPoolExecutor(max_workers=self._threads) as pool:
            for k in profile:
                print(fg("green"), attr("bold"), "Now injecting ", k, attr("reset"))
                exect = Executable(self._base, self._name, k)
                print(stylize("Getting golden outputs...", fg("yellow")))
                for n in profile[k]:
                    self._report.add_golden(exect.run_golden(n))
                for _ in range(self._nSamples):
                    sample = choice(list(profile[k].items()))
                    pool.submit(self._inject_instruction, exect, sample[0], choice(range(sample[1])))
        pool.shutdown()

    def _inject_instruction(self, exect, vec, instr):
        print(fg("white"), attr("bold"), "Injecting:\t", instr, " vec ", vec, attr("reset"))

        hanged = False
        crashed = False
        result = b""
        try:
            result = exect.run_injection(instr, vec, self._timeout)
        except ExecutionHanged:
            print(fg("red"), "HANGED", attr("reset"))
            hanged = True
        except ExecutionCrashed:
            print(fg("red"), "CRASHED", attr("reset"))
            crashed = True
        finally:
            r = dict(result=result.decode("utf-8"), hanged=hanged, 
                     testVec=vec,
                     crashed=crashed, campaign=self._campaign)
        self._report.add_run(r)
