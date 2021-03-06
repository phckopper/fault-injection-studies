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

    def get_map(self):
        return self.addresses

    def _load_address_map(self, location):
        self.addresses = []
        with open(location, "r") as f:
            for line in f:
                data = line.split(",", 3)
                self.addresses.append(Instruction(address=int(data[0]), text=data[2].strip(),
                                                  width=int(data[1])))
