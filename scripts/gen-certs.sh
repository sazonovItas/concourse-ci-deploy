#!/usr/bin/env bash

set -e

CERTS_DIR="${CERTS_DIR:=certs}"
OPENSSL_GENRSA_FLAGS="${OPENSSL_GENRSA_FLAGS:=}"

mkdir -p ${CERTS_DIR}

openssl genrsa ${OPENSSL_GENRSA_FLAGS:-} -out ${CERTS_DIR}/server.key 2048
openssl req -x509 -new -nodes -key ${CERTS_DIR}/server.key -sha256 -days 3651 -out ${CERTS_DIR}/server.crt -subj "/CN=ci.concourse.com"
