#!/usr/bin/env bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

#yum install lttng-tools
#yum install lttng-ust


cd "$(mktemp -d)" &&
wget http://lttng.org/files/lttng-modules/lttng-modules-latest-2.13.tar.bz2 &&
tar -xf lttng-modules-latest-2.13.tar.bz2 &&
cd lttng-modules-2.13.* &&
make &&
sudo make modules_install &&
sudo depmod -a


