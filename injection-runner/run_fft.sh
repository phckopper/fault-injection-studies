#!/bin/sh

echo "Running FFT benchmarks..."
screen -dmS fftexact bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_exact/ fft --mode dft --samples 30"
sleep 5
screen -dmS fftapprox1 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_approx_1/ fft --mode dft --samples 30"
sleep 5
screen -dmS fftapprox2 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_approx_2/ fft --mode dft --samples 30" 
sleep 5
screen -dmS fftapprox3 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_approx_3/ fft --mode dft --samples 30"
sleep 5
screen -dmS fftapprox4 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_approx_4/ fft --mode dft --samples 30"
sleep 5
screen -dmS fftapprox5 bash -c "time pipenv run python3 injection_runner.py run-campaign /home/phckopper/fault-injection-studies/fft_versions/fft_approx_5/ fft --mode dft --samples 30"
echo "Spawned the following screen enviroments"
screen -list

htop
