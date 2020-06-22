from utils.Models import *
from time import sleep

class Report(object):
    """
    This class implements report generation features for the injection campaigns
    Data is saved into a sqlite3 database

    Arguments:
    location -- where to save the report (string)
    """
    def __init__(self, location):
        database.start()
        database.create_tables([Campaign, Run, Instruction])

    """
    Starts a new campaign with a new set of parameters

    Arguments:
    params -- parameters used for the simulations
    """
    def start_campaign(self, params=""):
        self._current_campaign = Campaign(params=params)
        return self._current_campaign

    """
    Adds golden output to report.
    It's the correct output to which all runs will be compared to.

    Arguments:
    golden -- golden output (string)
    """
    def add_golden(self, golden):
        self._current_campaign.golden = golden.decode("utf-8")
        self._current_campaign.save()

    """
    Adds a new instruction to the database

    Arguments:
    address -- address of the instruction (int)
    width -- bit width of it's value (int)
    text -- textual IR representation (string)
    """
    def add_instruction(self, address, width, text, iters):
        instruction = Instruction()
        instruction.address = address
        instruction.width   = width
        instruction.text    = text
        instruction.iters   = iters
        instruction.save()
        return instruction

    """
    Adds a run to the report.
    Stores every injected run

    Arguments:
    """
    def add_run(self, run):
        r = Run(**run)
        r.save()
