FROM nvidia/cuda:11.2.2-cudnn8-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    # Clean up to reduce layer size
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

COPY requirements.txt /

RUN python3 -m pip install -r /requirements.txt

WORKDIR /field-boundary-webinar
