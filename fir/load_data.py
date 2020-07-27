LEN = 8000
CAP = 2**23 - 1

clamp = lambda n: max(min(CAP, n), -CAP)

def load_output(name):
        with open(name, "r") as f:
                    return [clamp(int(line)) for line in f]

