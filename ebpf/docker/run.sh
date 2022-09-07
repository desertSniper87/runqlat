#!/usr/bin/env bash

docker build -t ebpf-ubuntu .
docker run -it ebpf-ubuntu /bin/bash

