#!/usr/bin/env bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

sudo apt install bcc
sudo apt install bpfcc-tools 
sudo apt-get install "linux-headers-$(uname -r)"
