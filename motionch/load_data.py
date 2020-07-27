LEN = 1344
CAP = 2**7 - 1

clamp = lambda n: max(min(CAP, n), -CAP)

def load_output(name):
    data = []
    with open(name, "r") as f:
        for line in f:
            for d in line.split(","):
                try:
                    data.append(clamp(int(d.strip())))
                except ValueError:
                    data.append(0)
    return data
