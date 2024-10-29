# Concourse CI deployment

## TODO

- [ ] K3S:
	- [ ] create volume for worker in k3s deployment (to worker resources on the restart)
	- [ ] create script for dynamically adding worker to the web (maybe just set other replica set for worker)
- [ ] Docker compose:
	- [ ] create docker compose deployment
- [ ] Dial with metrics:
	- [ ] add metrics for web
	- [ ] add metrics for every worker
