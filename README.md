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

# Step up with region, key id, key secret and channel name

After enter docker container, add your own key id and key secret into script `/start_master_demo.sh`:

```
export AWS_DEFAULT_REGION=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_ACCESS_KEY_ID=xxx
export AWS_KVS_CHANNEL_NAME=xxx
```

# Run demo

```
root@xxxxxxxxxxx:/# ./start_master_demo.sh 
```

> note: root@xxxxxxxxxxx is your container id.

If demo is running, user could see a demo video stream via KVS console viewer client.
