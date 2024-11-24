#!/usr/bin/env bash

CERTS_DIR=certs

OPENSSL_GENRSA_FLAGS=""
openssl genrsa ${OPENSSL_GENRSA_FLAGS:-} -out $CERTS_DIR/server.key 2048
openssl req -x509 -new -nodes -key $CERTS_DIR/server.key -sha256 -days 3651 -out $CERTS_DIR/server.crt -subj "/CN=ci.concourse.com"
