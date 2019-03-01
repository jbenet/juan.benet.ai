
domain="juan.benet.ai"

build:
	hugo

add-to-ipfs: build
	ipfs-dumver public

update-dns:
	@echo "update TXT record for _dnslink.${domain} to:"
	@echo "dnslink=/ipfs/"$(shell tail -n1 .versions)

publish: add-to-ipfs update-dns
