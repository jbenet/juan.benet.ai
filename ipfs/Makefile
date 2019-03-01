
domain="juan.benet.ai"

build: deps
	hugo

deps:
	@which hugo >/dev/null || \
		go get -u github.com/gohugoio/hugo
	@which ipfs-dumver >/dev/null || \
		(echo "please install ipfs-dumver" && false)

add-to-ipfs: build
	ipfs-dumver public

update-dns:
	@echo "update TXT record for _dnslink.${domain} to:"
	@echo "dnslink=/ipfs/"$(shell tail -n1 .versions)

publish: add-to-ipfs update-dns
