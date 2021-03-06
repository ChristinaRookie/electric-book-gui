#!/bin/bash
# install prince
set -e
if [[ ! -d /opt/prince-install ]]; then
	mkdir /opt/prince-install
fi
cd /opt/prince-install
if [[ $(lsb_release -sr) == '18.04' ]]; then
	export PRINCE=prince_12.2-1_ubuntu$(lsb_release -sr)_amd64.deb
else
	export PRINCE=prince_11.1-1_ubuntu$(lsb_release -sr)_amd64.deb
fi

if [[ ! -e $PRINCE ]]; then
	curl -O https://www.princexml.com/download/$PRINCE
fi
dpkg -i $PRINCE
apt-get install -f -y
