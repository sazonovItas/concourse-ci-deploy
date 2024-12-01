#!/bin/bash

BUILD_DIR="${BUILD_DIR:=./build}"
FILES_DIR="${FILES_DIR:=./files}"
LINUX_DIR="${LINUX_DIR:=./linux}"

LINUX_VER="${LINUX_VER:=6.12.1}"
BUSYBOX_VER="${BUSYBOX_VER:=1.36.1}"

DOWNLOADS_DIR=${BUILD_DIR}/downloads
SOURCES_DIR=${BUILD_DIR}/sources
INITRD_DIR=${BUILD_DIR}/initrd
OUT_DIR=${BUILD_DIR}/out

LINUX_FILENAME=vmlinuz-${LINUX_VER}
INITRD_FILENAME=initrd-busybox-${BUSYBOX_VER}.img

IFS="."
LINUX_VERS=($LINUX_VER)
LINUX_MAJOR_VER=${LINUX_VERS[0]}
unset IFS
