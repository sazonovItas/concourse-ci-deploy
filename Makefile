gen-keys:
	./scripts/gen-keys.sh	
.PHONY: gen-keys

gen-certs:
	./scripts/gen-certs.sh
.PHONY: gen-certs

create-k3s-secrets:
	./scripts/create-k3s-secrets.sh
.PHONY: create-k3s-secrets
