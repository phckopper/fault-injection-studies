LEN = 8000

CAP = 2**22
clamp = lambda n: max(min(CAP, n), -CAP)
def getModNumber(n):
    if n > 0:
        return n % (CAP - 1)
    else:
        return n % (CAP * -1)

def load_output(name):
        with open(name, "r") as f:
                    return [getModNumber(int(line)) for line in f]

