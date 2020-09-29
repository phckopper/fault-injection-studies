#!/bin/sh

echo "Running fir benchmarks..."
screen -dmS firexact bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_exact/ fir --mode fthls --samples 30"
sleep 5
screen -dmS firapprox1 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_approx_1/ fir --mode fthls --samples 30"
sleep 5
screen -dmS firapprox2 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_approx_2/ fir --mode fthls --samples 30" 
sleep 5
screen -dmS firapprox3 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_approx_3/ fir --mode fthls --samples 30"
sleep 5
screen -dmS firapprox4 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_approx_4/ fir --mode fthls --samples 30"
sleep 5
screen -dmS firapprox5 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fir_versions/fir_approx_5/ fir --mode fthls --samples 30"
echo "Spawned the following screen enviroments"
screen -list

htop
