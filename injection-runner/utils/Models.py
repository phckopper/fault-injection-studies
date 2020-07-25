from sys import argv
from peewee import *
from playhouse.sqliteq import SqliteQueueDatabase
import atexit

@atexit.register
def _stop_worker_threads():
    database.stop()

database = SqliteQueueDatabase("report.db")

class TestVector(Model):
    code    = IntegerField()
    class Meta:
        database = database

class Instruction(Model):
    testVec = ForeignKeyField(TestVector, backref='testVec')
    address = IntegerField()
    width   = IntegerField()
    iters   = IntegerField()
    text    = TextField()
    class Meta:
        database = database

class Run(Model):
    testVec     = ForeignKeyField(TestVector, backref='testVec')
    path        = TextField()
    testVec     = IntegerField()
    result      = TextField()
    hanged      = BooleanField()
    crashed     = BooleanField()
    class Meta:
        database = database
