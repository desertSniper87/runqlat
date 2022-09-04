#!/usr/bin/env bash

if [ ! -d /tmp/lttng ]; then
    mkdir /tmp/lttng
fi
lttng create -o "/tmp/lttng/$(date -Iseconds)"

# enable most important kernel trace points
lttng enable-channel kernel -k
kernel_events=(
    "sched_switch,sched_process_*" "lttng_statedump_*"
    "irq_*" "signal_*" "workqueue_*" "power_cpu_frequency"
    "kmem_"{mm_page,cache}_{alloc,free} "block_rq_"{issue,complete,requeue}
    # "x86_exceptions_page_fault_"{user,kernel}
)
for event in "${kernel_events[@]}"; do
    lttng enable-event -c kernel -k "$event"
done

lttng enable-event -c kernel -k --syscall -a

# enable all user space tracepoints
lttng enable-channel ust -u
lttng enable-event -c ust -u -a

# actually start tracing
lttng start
