#!/usr/bin/env bash

yum install lttng-tools
yum install lttng-ust


cd "$(mktemp -d)" &&
wget http://lttng.org/files/lttng-modules/lttng-modules-latest-2.12.tar.bz2 &&
tar -xf lttng-modules-latest-2.12.tar.bz2 &&
cd lttng-modules-2.12.* &&
make &&
sudo make modules_install &&
sudo depmod -a
