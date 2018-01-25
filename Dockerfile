FROM dataplatform/docker-azkaban:1.0.5
MAINTAINER tpham

ARG confluent_kafka_version="0.11.0"

USER root

RUN apt-get update && \
    apt-get install -y wget && \
    wget -qO - https://packages.confluent.io/deb/4.0/archive.key | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/4.0 stable main" && \
    apt-get install -y build-essential && \
    apt-get update && \ 
    apt-get install -y python-dev librdkafka-dev && \
    pip install confluent-kafka==${confluent_kafka_version} && \
    apt-get remove -y --auto-remove build-essential && \
    apt-get purge -y build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
