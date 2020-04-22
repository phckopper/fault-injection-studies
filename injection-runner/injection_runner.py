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
@click.option('--threads', default=4, help='how many threads should be used')
@click.option('--args', multiple=True, help='args to provide to executable')
def run_campaign(executable, address_map, tolerance, threads, args):
    c = Campaign(executable, address_map, tolerance, threads, list(args))
    c.run()

if __name__ == '__main__':
    cli()
