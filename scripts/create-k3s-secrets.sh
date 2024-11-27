#!/usr/bin/env bash

set -e

K3S_NAMESPACE=${K3S_NAMESPACE:=concourse}
CONCOURSE_WEB_KEYS=${CONCOURSE_WEB_KEYS:=concourse-web-keys}
kubectl get -n $K3S_NAMESPACE secret $CONCOURSE_WEB_KEYS &> /dev/null || \
	kubectl create -n $K3S_NAMESPACE secret generic $CONCOURSE_WEB_KEYS \
	--from-file=keys/web/authorized_worker_keys \
	--from-file=keys/web/session_signing_key \
	--from-file=keys/web/session_signing_key.pub \
	--from-file=keys/web/tsa_host_key \
	--from-file=keys/web/tsa_host_key.pub

CONCOURSE_WORKER_KEYS=concourse-worker-keys
kubectl get -n $K3S_NAMESPACE secret $CONCOURSE_WORKER_KEYS &> /dev/null || \
	kubectl create -n $K3S_NAMESPACE secret generic $CONCOURSE_WORKER_KEYS \
	--from-file=keys/worker/tsa_host_key.pub \
	--from-file=keys/worker/worker_key \
	--from-file=keys/worker/worker_key.pub

CONCOURSE_SSL_CERTS=concourse-ssl-certs
kubectl get -n $K3S_NAMESPACE secret $CONCOURSE_SSL_CERTS &> /dev/null || \
	kubectl create -n $K3S_NAMESPACE secret generic $CONCOURSE_SSL_CERTS \
	--from-file=certs/server.key \
	--from-file=certs/server.crt
