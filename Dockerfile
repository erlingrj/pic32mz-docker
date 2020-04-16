FROM debian:buster

MAINTAINER sentiboard

# First we must add 32 bit architecture so we can install 32 bit libraries needed
RUN dpkg --add-architecture i386 
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    grep \
    gawk \
    make \
    ca-certificates \
    curl \
    procps \
    libc6:i386 
#    libx11-6:i386 \
#    libxext6:i386 \
#    libstdc++6:i386 \
#    libexpat1:i386







RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*




# Download and install MPLAB X IDE
#RUN wget https://www.microchip.com/mplabx-ide-linux-installer -0 /tmp/mplabx-ide-linux-installer
#RUN tar xf '/tmp/mplabx-ide-linux-installer' -C /tmp
#RUN USER=root /tmp/MPLABX-v5.35-linux-installer.sh -- --mode unattended --ide 1 --ipe 1 --8bitmcu 0 --16bitmcu 0 --32bitmcu 1 --othermcu 0




# Download and install XC32 compiler    
RUN wget https://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v2.15-full-install-linux-installer.run -O /tmp/xc32-installer
RUN chmod +x /tmp/xc32-installer
RUN /tmp/xc32-installer --mode unattended --netservername docker
RUN rm /tmp/xc32-installer
