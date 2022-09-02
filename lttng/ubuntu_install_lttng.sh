#!/usr/bin/env bash


apt-add-repository ppa:lttng/stable-2.12
apt-get update

apt-get install lttng-tools
apt-get install lttng-modules-dkms
apt-get install liblttng-ust-dev

