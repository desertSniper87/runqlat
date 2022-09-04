#!/usr/bin/env bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

./start_trace.sh 
./lttng_stop.sh 20 && stress --cpu  8 --timeout 20

