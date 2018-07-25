FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install sudo apt-utils

ARG USER
ARG UID

RUN groupadd -g $UID $USER && \
    adduser --uid $UID --gid $UID --disabled-password --gecos "" $USER

# enable sudo
RUN usermod -aG sudo $USER
RUN echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER

USER $USER
