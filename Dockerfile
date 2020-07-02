FROM registry.access.redhat.com/ubi8/ubi-minimal AS builder

RUN microdnf install git make autoconf automake  gcc tar findutils

RUN git clone https://github.com/horms/kexec-tools/ 
WORKDIR kexec-tools 

RUN ./bootstrap && ./configure && make

FROM registry.access.redhat.com/ubi8/ubi-minimal

COPY --from=builder /kexec-tools/build/sbin/kexec /
CMD kexec