LEN = 128
CAP = 2**15 - 1

clamp = lambda n: max(min(CAP, n), -CAP)

def load_output(name):
    data = []
    with open(name, "r") as f:
        for line in f:
            for d in line.split(" "):
                data.append(clamp(int(d)))
    return data
