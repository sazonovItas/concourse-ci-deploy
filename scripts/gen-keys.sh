#!/usr/bin/env bash

set -e

KEYS_DIR=${KEYS_DIR:=keys}

mkdir -p ${KEYS_DIR}/web ${KEYS_DIR}/worker

ssh-keygen -t rsa -b 4096 -m PEM -f ${KEYS_DIR}/web/session_signing_key -N ''
ssh-keygen -t rsa -b 4096 -m PEM -f ${KEYS_DIR}/web/tsa_host_key -N ''
ssh-keygen -t rsa -b 4096 -m PEM -f ${KEYS_DIR}/worker/worker_key -N ''

cp ${KEYS_DIR}/worker/worker_key.pub ${KEYS_DIR}/web/authorized_worker_keys
cp ${KEYS_DIR}/web/tsa_host_key.pub ${KEYS_DIR}/worker

