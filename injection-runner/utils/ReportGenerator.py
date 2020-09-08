import importlib.util
from glob import glob
import sys
from colored import fg, stylize
import numpy as np
from utils.Models import *

class ReportGenerator(object):
    def __init__(self, base, mode):
        self.base = base
        self.mode = mode
        self.csv = open(base + "/results.csv", "w")

    def run(self):
        print(stylize("loading load_data.py...", fg("blue")))
        self.load_lib()

        print(stylize("loading goldens...", fg("blue")))
        self.load_goldens()

        if self.mode == "fthls":
            self.run_fthls()
        elif self.mode == "dft":
            self.run_dft()

    def run_fthls(self):
        self.csv.write("address;text;count1;count2;count3;count4;count5;mses")
        vec = TestVector.get(TestVector.code == 1)

        for instr in Instruction.select().where(Instruction.testVec == vec):
            print("Now parsing {}".format(instr.text))
            self.csv.write("\n{};{};".format(instr.address, instr.text))
            for prof in Instruction.select().where(Instruction.address == instr.address).order_by(Instruction.testVec.asc()):
                self.csv.write("{};".format(prof.iters))

            for v in range(1, 6):
                crashang = 30
                for f in glob("{}/outputs/{}-{}-*.out".format(self.base, instr.address, v)):
                    crashang -= 1
                    data = self.lib.load_output(f)
                    if len(data) != len(self.goldens[v-1]):
                        data = np.zeros(len(self.goldens[v-1]))

                    mse = self.calc_mse(data, self.goldens[v-1])
                    self.csv.write("{:.5f};".format(mse))
                for c in range(crashang):
                    self.csv.write("-1;")

        self.csv.close()

    def run_dft(self):
        for v in range(1, 6):
            print("Analyzing vector ", v)
            mses = []
            self.csv.write("vector{};".format(v))
            crashang = 9581
            for f in glob("{}/outputs/*-{}-*.out".format(self.base, v)):
                crashang -= 1
                data = self.lib.load_output(f)
                if len(data) != len(self.goldens[v-1]):
                    data = np.zeros(len(self.goldens[v-1]))

                mse = self.calc_mse(data, self.goldens[v-1])
                mses.append(mse)
                self.csv.write("{:.5f};".format(mse))
            for c in range(crashang):
                self.csv.write("-1;")
            print("Mean MSE:", np.mean(mses))
            print("Max MSE:", max(mses))
            self.csv.write("\n")

        self.csv.close()

    def calc_mse(self, data, golden):
        return np.square(np.subtract(data, golden)).mean()

    def load_goldens(self):
        self.goldens = [self.lib.load_output("{}/outputs/golden-{}-0x0-0.out".format(self.base, v))
                for v in range(1, 6)]

    def load_lib(self):
        spec = importlib.util.spec_from_file_location("TmpLib", "{}/load_data.py".format(self.base))
        module = importlib.util.module_from_spec(spec)
        sys.modules["TmpLib"] = module
        spec.loader.exec_module(module)
        self.lib = module
