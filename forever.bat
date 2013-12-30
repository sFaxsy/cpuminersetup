#!/bin/bash
echo "-----------------------"
echo "-Forever Mining Script-"
echo "-----------------------"
sudo yum -y groupinstall "Development Tools"
sudo yum -y install git libcurl-devel python-devel screen rsync yasm numpy openssl-devel
cd ~
git clone https://github.com/pooler/cpuminer
cd cpuminer/
./autogen.sh
./configure CFLAGS="-O3"
make
cd ~
git clone https://github.com/bandroidx/stratum-mining-proxy
cd stratum-mining-proxy/
sudo python distribute_setup.py
cd litecoin_scrypt/
sudo python setup.py install
cd ..
sudo python setup.py develop
chmod +x mining_proxy.py
./mining_proxy.py -o stratum2.wemineltc.com -p 3333 &
screen
cd ~/cpuminer/