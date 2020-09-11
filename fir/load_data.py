LEN = 8000
CAP = 2**23 - 1

clamp = lambda n: max(min(CAP, n), -CAP)
def getSignedNumber(number, bitLength):
    mask = (2 ** bitLength) - 1
    if number & (1 << (bitLength - 1)):
        return number | ~mask
    else:
        return number & mask

def load_output(name):
        with open(name, "r") as f:
                    return [getSignedNumber(int(line), 23) for line in f]

