gen-keys:
	./scripts/gen-keys.sh	
.PHONY: gen-keys

create-k3s-secrets:
	./scripts/create-k3s-secrets.sh
.PHONY: create-k3s-secrets
