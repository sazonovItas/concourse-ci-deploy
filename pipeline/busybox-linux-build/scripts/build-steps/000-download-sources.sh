#!/bin/bash

echo "[DOWNLOADING SOURCES]"

varcheck DOWNLOADS_DIR LINUX_VER LINUX_MAJOR_VER BUSYBOX_VER

[ -d ${DOWNLOADS_DIR} ] || mkdir -p ${DOWNLOADS_DIR}

curl -LO --output-dir ${DOWNLOADS_DIR} https://cdn.kernel.org/pub/linux/kernel/v${LINUX_MAJOR_VER}.x/linux-${LINUX_VER}.tar.xz
curl -LO --output-dir ${DOWNLOADS_DIR} https://busybox.net/downloads/busybox-${BUSYBOX_VER}.tar.bz2
