#!/bin/sh

echo "Running motion benchmarks..."
screen -dmS motionexact bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_exact/ motion --mode fthls --samples 30"
sleep 5
screen -dmS motionapprox1 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_approx_1/ motion --mode fthls --samples 30"
sleep 5
screen -dmS motionapprox2 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_approx_2/ motion --mode fthls --samples 30" 
sleep 5
screen -dmS motionapprox3 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_approx_3/ motion --mode fthls --samples 30"
sleep 5
screen -dmS motionapprox4 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_approx_4/ motion --mode fthls --samples 30"
sleep 5
screen -dmS motionapprox5 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/motion_versions/motion_approx_5/ motion --mode fthls --samples 30"
echo "Spawned the following screen enviroments"
screen -list

htop
