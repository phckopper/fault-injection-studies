#!/usr/bin/env python3

import click
from utils.Campaign import Campaign

@click.group()
def cli():
    pass

@cli.command()
@click.argument('executable')
@click.argument('addressmap')
@click.argument('testvec')
@click.option('--tolerance', default=5, help='how many times slower should a run be to be a hang')
@click.option('--threads', default=4, help='how many threads should be used')
@click.option('--samples', default=30, help='how many samples should be used')
def run_campaign(executable, addressmap, testvec, tolerance, threads, samples):
    c = Campaign(executable, addressmap, testvec, tolerance, threads, samples)
    c.run()

if __name__ == '__main__':
    cli()
