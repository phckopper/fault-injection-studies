#!/usr/bin/env python3

import click
from utils.Campaign import Campaign

@click.group()
def cli():
    pass

@cli.command()
@click.argument('executable')
@click.argument('address_map')
@click.option('--tolerance', default=5, help='how many times slower should a run be to be a hang')
def run_campaign(executable, address_map, tolerance):
    c = Campaign(executable, address_map, tolerance)
    c.run()

if __name__ == '__main__':
    cli()
