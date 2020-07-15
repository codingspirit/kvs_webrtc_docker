FROM ubuntu:18.04

MAINTAINER Alex.Li zhiqinli@amazon.com

RUN apt update
RUN apt upgrade -y
RUN apt install git cmake g++ pkg-config gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y

RUN git clone --recursive https://github.com/awslabs/amazon-kinesis-video-streams-webrtc-sdk-c.git
RUN mkdir -p amazon-kinesis-video-streams-webrtc-sdk-c/build; cd amazon-kinesis-video-streams-webrtc-sdk-c/build; cmake ..; make
RUN curl https://raw.githubusercontent.com/codingspirit/kvs_webrtc_docker/master/start_master_demo.sh >> start_master_demo.sh
RUN chmod +x start_master_demo.sh
