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

RUN apk add --no-cache --virtual mono-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    mono

ENV RENODE_REVISION master
RUN git clone --recursive https://github.com/renode/renode.git /renode

ADD https://download.mono-project.com/sources/gtk-sharp212/gtk-sharp-2.12.0.tar.bz2 ./gtk-sharp-2.12.0.tar.bz2

WORKDIR /renode/build

RUN ../build.sh -vp -b ./src/Renode/Renode.csproj

