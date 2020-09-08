from concurrent.futures import ThreadPoolExecutor
from random import choice, choices, randint
from time import time
from colored import attr, fg, stylize
from utils.Executable import Executable, ExecutionCrashed, ExecutionHanged
from utils.Profiler import Profiler
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
    def __init__(self, base, name, mode, timeoutTolerance=5, threads=2, nSamples=30):
        self._exec = Executable(base, name)
        self._mode = mode
        self._report = Report()
        self._nSamples = nSamples
        self._timeout = timeoutTolerance
        self._threads = threads
        self._vecs = 5
        self._profiler = Profiler(self._exec, self._vecs, base + "/address.map", self._report)

    """Runs the campaign, printing the results to stdout"""
    def run(self):
        print(stylize("Starting campaign", fg("blue")))
        print(stylize("Profiling....", fg("yellow")))
        self._profiler.profile()
        if self._mode == "dft":
            self.inject_dft()
        elif self._mode == "fthls":
            self.inject_fthls()
        else:
            print(stylize("Invalid mode!", fg("red")))

    def inject_dft(self):
        print(stylize("Starting injection (DFT or D&T)", fg("blue")))
        with ThreadPoolExecutor(max_workers=self._threads) as pool:
            for vec in range(1, self._vecs + 1):
                self._exec.run_golden(vec)
                instructions = self._report.get_instructions_by_vec(vec)
                chosen_instr = choices(instructions, weights=(i.iters for i in instructions), k=self._nSamples)
                for instr in chosen_instr:
                    print(fg("green"), attr("bold"), "Now injecting ", instr.text, attr("reset"))
                    _iter = randint(0, instr.iters - 1)
                    _mask = (1 << randint(0, instr.width - 1))
                    pool.submit(self._inject_instruction, instr.address, _mask, _iter, vec)
        pool.shutdown()

    def inject_fthls(self):
        print(stylize("Starting injection (FTHLS)", fg("blue")))
        with ThreadPoolExecutor(max_workers=self._threads) as pool:
            for vec in range(1, self._vecs + 1):
                self._exec.run_golden(vec)
                for instr in self._report.get_instructions_by_vec(vec):
                    if instr.iters == 0:
                        continue # dirty dirty dirty hack, this should be handled in sql
                    print(fg("green"), attr("bold"), "Now injecting ", instr.text, attr("reset"))
                    for _ in range(self._nSamples):
                        _iter = randint(0, instr.iters - 1)
                        _mask = (1 << randint(0, instr.width - 1))
                        pool.submit(self._inject_instruction, instr.address, _mask, _iter, vec)
        pool.shutdown()

    def _inject_instruction(self, addr, mask, _iter, vec):
        print(fg("white"), attr("bold"), "Injecting:\t", addr, " mask ", mask, attr("reset"))

        hanged = False
        crashed = False
        result = b""
        try:
            result = self._exec.run_injection(addr, mask, _iter, vec, self._timeout)
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
