FROM ubuntu:18.04

# Update as required
ENV ARDUINO_IDE_VERSION 1.8.11
ENV DISPLAY :1.0
ENV HOSTNAME arduino

RUN  apt-get update \
        && apt-get install -y \
        software-properties-common \
        wget \
        default-jre \
        xvfb \
        xz-utils \
        curl \
        sudo \
        libgtk2.0-0 \
        && add-apt-repository ppa:deadsnakes/ppa \
        && add-apt-repository ppa:ubuntuhandbook1/apps \
        && apt-get update \
        && apt-get install -y avrdude avrdude-doc python3.7.2\
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -u 1000 -U -G root,plugdev,dialout,sudo developer \
        && sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'

RUN (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
	| tar xJC /usr/local/share \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino) \
        && ln -s /usr/bin/python3 /usr/bin/python

# Install arduino-cli as user developer
WORKDIR /home/developer
USER developer
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
