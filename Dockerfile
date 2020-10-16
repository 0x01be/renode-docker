FROM alpine

RUN apk add --no-cache --virtual renode-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    python3 \
    py3-pip \
    screen \
    polkit \
    gtk+2.0-dev \
    zeromq-dev \
    gettext-dev \
    curl-dev \
    coreutils

RUN apk add --no-cache --virtual renode-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    mono-dev

ENV RENODE_REVISION v1.10.1
RUN git clone --recursive https://github.com/renode/renode.git /renode

WORKDIR /renode

RUN ./build.sh -v -b Renode.sln

