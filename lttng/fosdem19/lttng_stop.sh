#!/bin/sh

if [ -n "$1" ]; then
    # delay stopping
    sleep "$1"
fi

lttng stop
lttng destroy
