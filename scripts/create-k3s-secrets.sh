#!/usr/bin/env bash

CONCOURSE_WEB_KEYS=concourse-web-keys
kubectl get secret $CONCOURSE_WEB_KEYS &> /dev/null || \
	kubectl create secret generic $CONCOURSE_WEB_KEYS \
	--from-file=./keys/web/authorized_worker_keys \
	--from-file=./keys/web/session_signing_key \
	--from-file=./keys/web/session_signing_key.pub \
	--from-file=./keys/web/tsa_host_key \
	--from-file=./keys/web/tsa_host_key.pub

CONCOURSE_WORKER_KEYS=concourse-worker-keys
kubectl get secret $CONCOURSE_WORKER_KEYS &> /dev/null || \
	kubectl create secret generic $CONCOURSE_WORKER_KEYS \
	--from-file=./keys/worker/tsa_host_key.pub \
	--from-file=./keys/worker/worker_key \
	--from-file=./keys/worker/worker_key.pub


