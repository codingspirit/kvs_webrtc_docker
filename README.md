# Quick Start KVS WebRTC SDK On Docker

This repo provides a Dockerfile to create out-of-box building environment for development.

## Prerequisites

Make sure docker has been installed on your machine. You can install it on Debian based Linux OS via:

```
sudo apt install docker-ce docker-ce-cli containerd.io
```

## Build docker image

```
wget https://raw.githubusercontent.com/codingspirit/kvs_webrtc_docker/master/Dockerfile
docker build -t iotlab/kvs-webrtc:1.0.0 .
```

## Start container with built image

```
docker run -it iotlab/kvs-webrtc:1.0.0
```

## Step up with region, key id, key secret and channel name

After enter docker container, add your own key id and key secret into script `/start_master_demo.sh`:

```
#!/bin/sh

export AWS_DEFAULT_REGION=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_ACCESS_KEY_ID=xxx
export AWS_KVS_CHANNEL_NAME=xxx

cd amazon-kinesis-video-streams-webrtc-sdk-c/build/
./kvsWebrtcClientMaster ${AWS_KVS_CHANNEL_NAME}
```

## Run demo

```
root@xxxxxxxxxxx:/# ./start_master_demo.sh 
```

> note: root@xxxxxxxxxxx is your container id.

If demo is running, user could see a demo video stream via KVS console viewer client or KVS WebRTC test page.

## Use KVS WebRTC test page as viewer
1. Go to [KVS WebRTC Test Page](https://awslabs.github.io/amazon-kinesis-video-streams-webrtc-sdk-js/examples/index.html)
2. Fill region, credentials and signaling channel info.
3. Click `Start Viewer`:

![](https://github.com/codingspirit/kvs_webrtc_docker/blob/master/test_page.png)

## Cross-Compilation
For cross-compilation, add your own toolchain and plantform info into script `/cross_compile_sdk.sh`:

```
#!/bin/sh

cd amazon-kinesis-video-streams-webrtc-sdk-c/
if [ -n "$1" ]; then
    if [ $1 = "clean" ]; then
        rm -rf build
    fi
fi

if [ -d "build" ]; then
    mkdir build
fi
cd build

# For Cross-Compilation
export CC=arm-linux-gnueabi-gcc
export CXX=arm-linux-gnueabi-g++
cmake .. -DBUILD_OPENSSL=TRUE -DBUILD_OPENSSL_PLATFORM=linux-generic32 -DBUILD_LIBSRTP_HOST_PLATFORM=x86_64-unknown-linux-gnu -DBUILD_LIBSRTP_DESTINATION_PLATFORM=arm-unknown-linux-uclibcgnueabi
make

```
