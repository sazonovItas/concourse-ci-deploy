#!/bin/bash

echo "[BUILDING LINUX]"

varcheck SOURCES_DIR LINUX_DIR LINUX_VER LINUX_FILENAME

[ -d ${LINUX_DIR} ] || mkdir -p ${LINUX_DIR}

cd ${SOURCES_DIR}/linux-${LINUX_VER}
make defconfig
make -j$(grep -c "processor" /proc/cpuinfo) || exit
cd -
cp ${SOURCES_DIR}/linux-${LINUX_VER}/arch/x86_64/boot/bzImage ${LINUX_DIR}/${LINUX_FILENAME}
