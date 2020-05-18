class Profile(object):
    def __init__(self, base):
        self._base = base

    def load(self):
        data = {}
        with open(self._base + "/profile.csv", "r") as f:
            f.readline()
            for l in f:
                d = l.split(",")
                data.setdefault(d[0], {})[d[1]] = int(d[2])
        return data

