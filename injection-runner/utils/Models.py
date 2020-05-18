from peewee import *
from playhouse.sqliteq import SqliteQueueDatabase
import atexit

database = SqliteDatabase("report.db")

class Campaign(Model):
    params = TextField()
    golden = TextField()
    class Meta:
        database = database

class Instruction(Model):
    address = IntegerField(unique=True, index=True)
    width   = IntegerField()
    text    = TextField()
    class Meta:
        database = database

class Run(Model):
    campaign    = ForeignKeyField(Campaign, backref='runs')
    result      = TextField()
    hanged      = BooleanField()
    crashed     = BooleanField()
    class Meta:
        database = database
