from collections import defaultdict
from utils.AddressMap import AddressMap

class Profiler(object):
    def __init__(self, executable, nVectors, addressMap, report):
        self._map = AddressMap(addressMap)
        self._exec = executable
        self._nvectors = nVectors
        self._report = report

    def profile(self):
        instructions = list(self._map)
        for v in range(1, self._nvectors + 1):
            print("Profiling test vector ", v)
            vector = self._report.add_test_vector(v)
            output = self._exec.run_profiling(v)
            counts = self._parse_output(output)
            for instr in instructions:
                iters = counts[str(instr.address)]
                print(vector, instr.text, iters)
                if instr.width == 0: # it's a pointer! assume it's 64 bit
                    instr.width = 64
                self._report.add_instruction(vector, instr.address, instr.width,
                                             instr.text, iters)

    def _parse_output(self, output):
        counts = defaultdict(int)
        for l in output.splitlines():
            counts[l.decode("utf-8").strip()] += 1
        return counts
