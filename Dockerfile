FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf install git make autoconf automake  gcc tar findutils

RUN git clone https://github.com/horms/kexec-tools/ 
WORKDIR kexec-tools 

RUN ./bootstrap && ./configure && make