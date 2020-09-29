LEN = 786432

clamp = lambda x: max(0, min(255, x))

def load_output(name):
    with open(name, "r") as f:
        return [clamp(int(line)) for line in f]
