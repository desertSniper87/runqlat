FROM ubuntu:20.04
COPY runqlat.py /
RUN apt update
RUN apt install bcc -y
RUN apt install bpfcc-tools -y
RUN apt install python3 -y
RUN apt-get install "linux-headers-$(uname -r)" -y
#ENTRYPOINT ["python3.8", "runqlat.py"]
