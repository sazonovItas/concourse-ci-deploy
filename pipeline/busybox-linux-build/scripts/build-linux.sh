#!/usr/bin/env bash

set -e
echo "[BUILDING LINUX]"

BUILD_STEPS_DIR=${BUILD_STEPS_DIR:=./build-steps}
BUILD_USING_STEPS=${BUILD_USING_STEPS:=*}

for script in $(ls ${BUILD_STEPS_DIR}/${BUILD_USING_STEPS}); do
  pushd .
  . $script
  popd
done
