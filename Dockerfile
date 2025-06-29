FROM debian:bookworm-slim AS builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    dh-autoreconf \
    ca-certificates \
    libdb5.3-dev \
    libssl-dev \
    libsasl2-dev \
    zlib1g-dev \
    perl \
    git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build

ARG TAG=master

RUN git clone \
    --branch ${TAG} \
    --single-branch \
    --depth 1 \
    https://git.code.sf.net/p/isync/isync . && \
    ./autogen.sh && \
    ./configure --prefix=/install && \
    mkdir -p /install && \
    make -j$(nproc) && \
    make install

FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    libdb5.3 \
    libssl3 \
    libsasl2-2 \
    zlib1g \
    perl && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /install /usr/local
