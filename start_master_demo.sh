#!/bin/sh

export AWS_DEFAULT_REGION=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_ACCESS_KEY_ID=xxx
export AWS_KVS_CHANNEL_NAME=xxx

amazon-kinesis-video-streams-webrtc-sdk-c/build/kvsWebrtcClientMaster ${AWS_KVS_CHANNEL_NAME}
