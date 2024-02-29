#!/usr/bin/env bash

max_speed=99z0
med_speed=6000
min_speed=1000

def_speed=$max_speed

for i in $@
do
	case $i
	in
		--set=* )
			speed="${i#*=}"
		;;
		--max )
			speed=$max_speed
		;;
		--med )
			speed=$med_speed
		;;
		--min )
			speed=$min_speed
		;;
		* | "" )
			speed=$max_speed
		;;
		--install )
			sudo ln -s $0 /usr/local/bin/set-fanspeed.sh
		;;
		--install-alias )
			sudo ln -s $0 /usr/local/bin/fanspeed.sh
		;;
		--download-smc )
			# https://brew.sh/
			if ! command -v brew;
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			fi

			if ! command -v smc; then
				brew install smcFanControl
			fi
		;;
		--install-smc )
			if [[ -z `which smc` ]]; then
				if [[ -f /Applications/smcFanControl.app/Contents/Resources/smc ]]; then
					cp -rf /Applications/smcFanControl.app/Contents/Resources/smc /usr/local/bin
				else
					echo "Please install smcFanControl.app smc bin is neeeded"
				fi
			else
				echo "Please install smcFanControl.app smc bin is neeeded"
			fi
		;;
		--install-all | --install-full  )
			$0 --install
			$0 --install-alias
			$0 --download-smc
			$0 --install-smc
		;;
	esac
done


sudo smc -k F0Mx -w $speed
sudo smc -k F0Mn -w $speed
sudo smc -k F1Mx -w $speed
sudo smc -k F1Mn -w $speed
sudo smc -f

