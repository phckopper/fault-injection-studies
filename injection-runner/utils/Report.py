from utils.Models import *
from time import sleep

class Report(object):
    """
    This class implements report generation features for the injection campaigns
    Data is saved into a sqlite3 database

    Arguments:
    location -- where to save the report (string)
    """
    def __init__(self):
        database.start()
        database.create_tables([TestVector, Run, Instruction])

    """
    Adds a new test vector to the database

    Arguments:
    code -- test vector code
    """
    def add_test_vector(self, code):
        vector = TestVector(code=code)
        vector.save()
        return vector

    """
    Adds a new instruction to the database

    Arguments:
    vector -- test vector used for profiling
    address -- address of the instruction (int)
    width -- bit width of it's value (int)
    text -- textual IR representation (string)
    iters -- number of times the instruction ran (int)
    """
    def add_instruction(self, vector, address, width, text, iters):
        instruction = Instruction()
        instruction.testVec = vector
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

    """
    """
    def get_instructions_by_vec(self, vec):
        v = TestVector.get(TestVector.code == vec)
        return Instruction.select().where(Instruction.testVec == v)
