BINARY := ipapk-server
VERSION ?= v1.0.0
PLATFORMS := windows linux darwin

.PHONY: $(PLATFORMS)
$(PLATFORMS):
	CGO_ENABLED=1 GO15VENDOREXPERIMENT=1 GOOS=$@ GOARCH=amd64 go build -ldflags "-X main.version=$(VERSION)" -o $(BINARY)-$(VERSION)-$@-amd64

.PHONY: release
release: windows linux darwin

deploy:
	docker-compose build
	docker-compose push
	rsync -aP -e 'ssh -S none' stack.yml dev@ql6625.fr:fr.ql6625.apps
	ssh dev@ql6625.fr 'cd fr.ql6625.apps && docker stack deploy --with-registry-auth -c stack.yml fr_ql6625_apps'
