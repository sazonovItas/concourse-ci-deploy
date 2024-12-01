#!/bin/bash

echo "[BUILDING BUSYBOX]"

varcheck SOURCES_DIR OUT_DIR BUSYBOX_VER

[ -d ${OUT_DIR} ] || mkdir -p ${OUT_DIR}

cd ${SOURCES_DIR}/busybox-${BUSYBOX_VER}
make defconfig
make clean && make LDFLAGS=-static
cd -
cp ${SOURCES_DIR}/busybox-${BUSYBOX_VER}/busybox ${OUT_DIR}/
chmod a+x ${OUT_DIR}/busybox
