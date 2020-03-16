#!/usr/bin/env python3

from sys import argv
from utils.Campaign import Campaign

c = Campaign(argv[1], argv[2])
c.run()

