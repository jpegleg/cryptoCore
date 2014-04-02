#!/bin/bash

mkdir ~/Scripts 2> /dev/null
mkdir ~/seeds/ 2> /dev/null
chmod 777 ~/seeds
cp xor.sh ~/Scripts/xor.sh
cat cryptoCore >> ~/.bashrc
