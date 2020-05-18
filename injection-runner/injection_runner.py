#!/usr/bin/env python3

import click
from utils.Campaign import Campaign

@click.group()
def cli():
    pass

@cli.command()
@click.argument('base')
@click.argument('name')
@click.option('--tolerance', default=5, help='how many times slower should a run be to be a hang')
@click.option('--threads', default=4, help='how many threads should be used')
@click.option('--samples', default=385, help='how many samples should be used')
def run_campaign(base, name, tolerance, threads, samples):
    c = Campaign(base, name, tolerance, threads, samples)
    c.run()

if __name__ == '__main__':
    cli()
