#!/bin/sh

echo "Running JPEG benchmarks..."
#screen -dmS jpegexact bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_exact/ jpeg --mode dft --samples 385 --tolerance 10"
#sleep 5
#screen -dmS jpegapprox1 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_approx_1/ jpeg --mode dft --samples 385 --tolerance 10"
#sleep 5
screen -dmS jpegapprox2 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_approx_2/ jpeg --mode dft --samples 385 --tolerance 10"
sleep 5
screen -dmS jpegapprox3 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_approx_3/ jpeg --mode dft --samples 385 --tolerance 10"
sleep 5
screen -dmS jpegapprox4 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_approx_4/ jpeg --mode dft --samples 385 --tolerance 10"
sleep 5
screen -dmS jpegapprox5 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/jpeg_versions/jpeg_approx_5/ jpeg --mode dft --samples 385 --tolerance 10"
echo "Spawned the following screen enviroments"
screen -list
