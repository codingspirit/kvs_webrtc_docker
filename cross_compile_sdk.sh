#!/bin/sh

cd amazon-kinesis-video-streams-webrtc-sdk-c/
git clean -xfd

mkdir build && cd build

# For Cross-Compilation
export CC=arm-linux-gnueabi-gcc
export CXX=arm-linux-gnueabi-g++
cmake .. -DBUILD_OPENSSL=TRUE -DBUILD_OPENSSL_PLATFORM=linux-generic32 -DBUILD_LIBSRTP_HOST_PLATFORM=x86_64-unknown-linux-gnu -DBUILD_LIBSRTP_DESTINATION_PLATFORM=arm-unknown-linux-uclibcgnueabi
make
