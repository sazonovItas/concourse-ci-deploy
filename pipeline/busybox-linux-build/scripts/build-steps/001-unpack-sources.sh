#!/bin/bash

echo "[UNPACKING SOURCES]"

varcheck DOWNLOADS_DIR SOURCES_DIR LINUX_VER BUSYBOX_VER

[ -d ${SOURCES_DIR} ] || mkdir -p ${SOURCES_DIR}

tar -xf ${DOWNLOADS_DIR}/linux-${LINUX_VER}.tar.xz -C ${SOURCES_DIR}
tar -xjf ${DOWNLOADS_DIR}/busybox-${BUSYBOX_VER}.tar.bz2 -C ${SOURCES_DIR}
