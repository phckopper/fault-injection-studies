#!/usr/bin/env python3

import click
from utils.Campaign import Campaign
from utils.ReportGenerator import ReportGenerator

@click.group()
def cli():
    pass

@cli.command()
@click.argument('base')
@click.argument('name')
@click.option('--mode', type=click.Choice(['dft', 'fthls'], case_sensitive=False))
@click.option('--tolerance', default=5, help='how many times slower should a run be to be a hang')
@click.option('--threads', default=4, help='how many threads should be used')
@click.option('--samples', default=30, help='how many samples should be used')
def run_campaign(base, name, mode, tolerance, threads, samples):
    c = Campaign(base, name, mode, tolerance, threads, samples)
    c.run()

@cli.command()
@click.argument('base')
@click.option('--mode', type=click.Choice(['dft', 'fthls'], case_sensitive=False))
def generate_report(base, mode):
    g = ReportGenerator(base, mode)
    g.run()

if __name__ == '__main__':
    cli()
