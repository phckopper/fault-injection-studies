from peewee import *

database = SqliteDatabase("report.db")

class Campaign(Model):
    params = TextField()
    golden = TextField()
    class Meta:
        database = database

class Instruction(Model):
    address = IntegerField(unique=True, index=True, primary_key=True)
    width   = IntegerField()
    text    = TextField()
    class Meta:
        database = database

class Run(Model):
    instruction = ForeignKeyField(Instruction, backref='runs')
    campaign    = ForeignKeyField(Campaign, backref='runs')
    mask        = CharField(20)
    result      = TextField()
    hanged      = BooleanField()
    crashed     = BooleanField()
    class Meta:
        database = database
