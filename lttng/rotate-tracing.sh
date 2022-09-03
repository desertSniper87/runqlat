#!/usr/bin/env bash


if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

lttng create my-session

lttng enable-event --kernel sched_'*'
lttng start

lttng rotate
