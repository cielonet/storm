FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive    # export DEBIAN_FRONTEND="noninteractive"

# Install dependencies
RUN apt-get update && apt-get install -y \
    gcc-7 g++-7 gcc-7-multilib g++-7-multilib \
    wget \
    git \
    binutils \
    bzip2 \
    libncurses5 libncurses5-dev \
    flex \
    python \
    perl \
    make \
    findutils \
    grep \
    diffutils \
    unzip \
    gawk \
    util-linux mkisofs \
    subversion \
    libz-dev \
    libc6-dev \
    curl 
RUN curl -L https://cpanmin.us | perl - App::cpanminus 
RUN cpanm Getopt::Std
RUN mkdir /tools && touch /tools/installed

RUN ln -s /usr/bin/g++-7 /usr/bin/g++

# Set the working directory
WORKDIR /workspace

# Create a volume to store installed tools
VOLUME ["/tools"]
