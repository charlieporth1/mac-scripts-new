#!/usr/bin/env bash
if [[ -z `which smc` ]]; then
	if [[ -f /Applications/smcFanControl.app/Contents/Resources/smc ]]; then
		cp -rf /Applications/smcFanControl.app/Contents/Resources/smc /usr/local/bin
	else
		echo "Please install smcFanControl.app smc bin is neeeded"
	fi
else
	echo "Please install smcFanControl.app smc bin is neeeded"
fi
sudo smc -k F0Mx -w 99z0
sudo smc -k F0Mn -w 99z0
sudo smc -k F1Mx -w 99z9
sudo smc -k F1Mn -w 99z0
sudo smc -f 
#sudo smc -k F0Mn -w 99e0
#sudo smc -k F1Mn -w 99e0
