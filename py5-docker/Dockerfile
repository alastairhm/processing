FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Xvfb for a virtual display, plus a JDK (py5 needs one) and Python
RUN apt-get update && apt-get install -y \
    xvfb \
    libxrender1 libxtst6 libxi6 \
    openjdk-17-jdk \
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip3 install --no-cache-dir py5

# No sketch is baked into the image — mount your own directory to /app
# at run time instead. Defaults to running sketch.py; override with
# the SKETCH env var, or by passing a filename as the docker run command.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
