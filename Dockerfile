FROM debian:buster

MAINTAINER sentiboard

#RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    make \
    ca-certificates \
    curl \
    procps 
#    libc6:i386 \
#    libx11-6:i386 \
#    libxext6:i386 \
#    libstdc++6:i386 \
#    libexpat1:i386







RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*




# Download and install MPLAB X IDE
# Commented out for now. We would need MPLAB X IPE to program firmware to test boards
#RUN wget https://www.microchip.com/mplabx-ide-linux-installer -0 /tmp/mplabx-ide-linux-installer
#RUN tar xf '/tmp/mplabx-ide-linux-installer' -C /tmp
#RUN USER=root /tmp/MPLABX-v5.35-linux-installer.sh -- --mode unattended --ide 1 --ipe 1 --8bitmcu 0 --16bitmcu 0 --32bitmcu 1 --othermcu 0




# Download and install XC32 compiler v2.15
RUN wget http://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v2.15-full-install-linux-installer.run -O /tmp/mplabxc32linux
RUN chmod +x /tmp/mplabxc32linux
RUN /tmp/mplabxc32linux --mode unattended --netservername docker

