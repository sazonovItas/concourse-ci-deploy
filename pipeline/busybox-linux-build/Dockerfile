FROM debian:12
RUN apt update && apt install --yes make build-essential bc bison flex libssl-dev libelf-dev curl
RUN apt install --yes cpio fdisk extlinux dosfstools qemu-system-x86
RUN apt install --yes vim

ARG APP=/app
ARG LINUX_DIR=$APP/linux
ARG SCRIPTS_DIR=$APP/scripts
ARG FILES_DIR=$SCRIPTS_DIR/files

ENV BUILD_DIR=$APP/build
ENV LINUX_DIR=$LINUX_DIR
ENV FILES_DIR=$FILES_DIR
ENV LINUX_VER=6.12.1
ENV BUSYBOX_VER=1.36.1
ENV BASH_ENV="$SCRIPTS_DIR/bash-env/env" 
 
COPY ./scripts $APP/scripts
RUN mkdir -p $LINUX_DIR
RUN  ln -s $APP/scripts/start-linux.sh /usr/bin/start &&\
     ln -s $APP/scripts/build-linux.sh /usr/bin/build &&\
     ln -s $APP/scripts/build-image.sh /usr/bin/image

WORKDIR $APP/scripts

CMD build
