from sys import argv
from peewee import *
from playhouse.sqliteq import SqliteQueueDatabase
import atexit

@atexit.register
def _stop_worker_threads():
    database.stop()

database = SqliteQueueDatabase("report.db")

class Campaign(Model):
    params = TextField()
    golden = TextField()
    class Meta:
        database = database

class Instruction(Model):
    address = IntegerField(unique=True, index=True)
    width   = IntegerField()
    iters   = IntegerField()
    text    = TextField()
    class Meta:
        database = database

class Run(Model):
    campaign    = ForeignKeyField(Campaign, backref='runs')
    path        = TextField()
    testVec     = IntegerField()
    result      = TextField()
    hanged      = BooleanField()
    crashed     = BooleanField()
    class Meta:
        database = database