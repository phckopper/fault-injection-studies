#!/usr/bin/env python3

import numpy as np
from glob import glob
from statistics import mean
from sys import argv
from utils.Models import *

clamp = lambda x: max(0, min(255, x))

def load_output(name):
    with open(name, "r") as f:
        return [clamp(int(line)) for line in f]

instructions = Instruction.select()
golden = load_output("results/golden.out")
csv = open("results.csv", "w")
csv.write("address;text;count;width;mse;correct;crashang\n")

def calc_mse(data, golden):
    return np.square(np.subtract(data, golden)).mean()

mses_all = []

for instr in instructions:
    print("now analysing instruction ", instr.width)
    mses = []
    crashang = 385
    correct = 0
    for f in glob("results/"+str(instr.address)+"*.out"):
        crashang -= 1
        data = load_output(f)
        if len(data) != 4000:
            data = np.zeros(4000)

        mse_approx = calc_mse(data, golden)
        if mse_approx == 0:
            correct += 1
        else:
            mses.append(mse_approx)

    csv.write("{};{};{};{};".format(instr.address, instr.width, instr.iters, instr.text))
    csv.write("{};{}\n".format(np.mean(mses), correct, crashang))
    print("mean: ", np.mean(mses), "correct ", correct, "crashang ", crashang)
    mses_all.append(np.mean(mses))

print("mean mse (global): ", np.mean(mses_all))
csv.close()
