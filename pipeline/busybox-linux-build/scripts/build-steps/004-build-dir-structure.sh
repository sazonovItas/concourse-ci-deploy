#!/bin/bash

echo "[BUILDING_DIR_STRUCTURE]"

varcheck FILES_DIR INITRD_DIR OUT_DIR

[ -d ${OUT_DIR} ] || mkdir -p ${OUT_DIR}
[ -d ${INITRD_DIR} ] || mkdir -p ${INITRD_DIR}

[ -f ${FILES_DIR}/init ] && cp ${FILES_DIR}/init ${INITRD_DIR}

[ -f ${INITRD_DIR}/init ] && chmod 777 ${INITRD_DIR}/init

cd ${INITRD_DIR}
mkdir -p bin dev proc sys usr/bin
cd -

cp ${OUT_DIR}/busybox ${INITRD_DIR}/bin/

cd ${INITRD_DIR}
for prog in $(./bin/busybox --list); do
  [ -f ./bin/$prog ] || ln -sL /bin/busybox ./bin/$prog
done
