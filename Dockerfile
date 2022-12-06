FROM ubuntu:20.04
LABEL maintainer="Akos Becsey <becsey.a@gmail.com>"
LABEL Description="Image for building and testing a modm based embedded project"

WORKDIR /work

ADD . /work

# installer script expects a UI desktop distor, so make sure we are compatible
ENV TZ=Europe/Budapest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y install sudo

RUN /work/install-build-tools.sh /opt
RUN git -C /opt clone --recurse-submodule https://github.com/modm-io/modm.git

ENV CUSTOM_CROSS_TOOLCHAIN_PATH "/opt/gcc-arm-none-eabi-10.3-2021.10/bin"
