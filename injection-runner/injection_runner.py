#!/usr/bin/env python3

import click
from utils.Campaign import Campaign

@click.group()
def cli():
    pass

@cli.command()
@click.argument('executable')
@click.option('--instructions', required=True, help='how many instructions are run without flaws', type=int)
@click.option('--tolerance', default=5, help='how many times slower should a run be to be a hang')
@click.option('--threads', default=4, help='how many threads should be used')
@click.option('--args', multiple=True, help='args to provide to executable')
def run_campaign(executable, instructions, tolerance, threads, args):
    c = Campaign(executable, instructions, tolerance, threads, list(args))
    c.run()

if __name__ == '__main__':
    cli()
