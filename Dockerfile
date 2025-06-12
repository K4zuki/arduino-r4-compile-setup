FROM ubuntu:24.04

ENV ARDUINO_UPDATER_ENABLE_NOTIFICATION=false
RUN apt update && apt upgrade -y && \
    apt install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh -s 1.2.2
RUN arduino-cli core install arduino:renesas_uno@1.4.1

WORKDIR /arduino
ENTRYPOINT ["arduino-cli"]
