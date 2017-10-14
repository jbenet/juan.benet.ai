# README.md because github.

index.html: README.md deps
	marked README.md >$@

README.md: index.md list-headshots.sh
	cat index.md >$@
	sh ./list-headshots.sh >>$@

deps:
	which marked >/dev/null || make marked

marked:
	npm install -g marked

clean:
	rm README.md

publish-to-ipfs:
	ipfs swarm addrs >/dev/null
	@hash=$(shell ipfs add -q -w -r . | tail -n1) && \
		echo "http://localhost:8080/ipfs/$$hash" && \
		echo "https://gateway.ipfs.io/ipfs/$$hash"
