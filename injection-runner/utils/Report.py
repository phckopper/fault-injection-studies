from utils.Models import *

class Report(object):
    """
    This class implements report generation features for the injection campaigns
    Data is saved into a sqlite3 database

    Arguments:
    location -- where to save the report (string)
    """
    def __init__(self, location):
        database.connect()
        database.create_tables([Campaign, Instruction, Run])

    """
    Starts a new campaign with a new set of parameters

    Arguments:
    params -- parameters used for the simulations
    """
    def start_campaign(self, params=""):
        self._current_campaign = Campaign(params=params)

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
    Adds a new instruction and starts adding subsequent runs to it

    Arguments:
    address -- address of the instruction (int)
    width -- bit width of it's value (int)
    text -- textual IR representation (string)
    """
    def add_and_start_instruction(self, address, width, text):
        self._current_instruction = Instruction()
        self._current_instruction.address = address
        self._current_instruction.width   = width
        self._current_instruction.text    = text
        self._current_instruction.save()
        print(self._current_instruction.text)


    """
    Adds a run to the report.
    Stores every injected run  mask and result.

    Arguments:
    mask -- the mask that was injected
    retult -- final output of the program
    """
    def add_run(self, mask, result=b"", hanged=False, crashed=False):
        run = Run(mask=hex(mask), result=result.decode("utf-8"), hanged=hanged, crashed=crashed)
        run.campaign = self._current_campaign
        run.instruction = self._current_instruction
        run.save()

