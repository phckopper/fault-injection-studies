class Instruction:
    def __init__(self, address, text, width):
        self.address = address
        self.text = text
        self.width = width

class AddressMap(object):
    """
    This class provides utilities to load address maps and iterate over them
    """
    def __init__(self, location):
        self._load_address_map(location)
        self.iter = 0

    def __iter__(self):
        return self

    def __next__(self):
        self.iter += 1
        if self.iter >= len(self.addresses):
            raise StopIteration
        return self.addresses[self.iter]

    def _load_address_map(self, location):
        self.addresses = []
        with open(location, "r") as f:
            for line in f:
                data = line.split(",", 2)
                self.addresses.append(Instruction(int(data[0]), data[2].strip(), int(data[1])))
