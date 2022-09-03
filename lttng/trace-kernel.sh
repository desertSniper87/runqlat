#!/usr/bin/env bash

lttng create my-kernel-session --output=/tmp/my-kernel-trace

lttng list --kernel
lttng list --kernel --syscall

lttng enable-event --kernel sched_switch,sched_process_fork
lttng enable-event --kernel --syscall open,close

lttng enable-event --kernel --all
lttng start

SEC=5
echo "Sleeping for $SEC seconds"
sleep $SEC

lttng destroy
