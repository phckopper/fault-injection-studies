class Report(object):
    """
    This class implements report generation features for the injection campaigns

    Arguments:
    location -- where to save the report (string)
    """
    def __init__(self, location):
        self.runs = {}
        self.location = location

    """
    Adds golden output to report.
    It's the correct output to which all runs will be compared to.

    Arguments:
    golden -- golden output (string)
    """
    def add_golden(self, golden):
        self.golden = str(golden)

    """
    Adds a run to the report.
    Stores every injected run instruction, mask and result to an internal list.

    Arguments:
    instruction -- the instruction which was injected
    mask -- the mask that was injected
    retult -- final output of the program
    """
    def add_run(self, instruction, mask, result="", hanged=False):
        data = dict(instr=instruction, mask=mask, result=str(result), hanged=hanged)
        self.runs.setdefault(instruction.address, []).append(data)

    """ Compiles the report and writes it to location"""
    def write_report(self):
        with open(self.location, "w") as f:
            for i in self.runs:
                f.write(self._process_instruction(self.runs[i]))

    def _process_instruction(self, data):
        good = 0
        bad = 0
        hanged = 0
        for run in data:
            if run["result"] == self.golden:
                good += 1
            else:
                if run["hanged"]:
                    hanged += 1
                else:
                    bad += 1
        total = len(data)
        return "@{} {:40} | SDU: {} Correct: {} Hang: {} Percentage: {:.2f}%\n".format(
            data[0]["instr"].address, data[0]["instr"].text, bad, good, hanged, ((hanged+bad)/(total)*100))

