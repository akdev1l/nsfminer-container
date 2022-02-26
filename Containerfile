FROM fedora:latest
ARG NSFMINER_RELEASE="https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.14/nsfminer_1.3.14-ubuntu_20.04-cuda_11.3.tgz"

RUN curl -L "${NSFMINER_RELEASE}" > /tmp/nsfminer.tar.gz

FROM nvidia/cuda:11.0-base
ENV MINING_TIMEOUT=3600
ENV MINING_POOL=stratum+ssl://0x47Df035d58fd1693be5658c0c2a79f2D1ca3DC15@us1.ethermine.org:5555

COPY --from=0 /tmp/nsfminer.tar.gz /opt
COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /opt

RUN tar xvf /opt/nsfminer.tar.gz

ENTRYPOINT ["/entrypoint.sh"]
