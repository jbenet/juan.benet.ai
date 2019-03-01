index.md: _src.md list-headshots.sh
	cat _src.md >$@
	sh list-headshots.sh >>$@

deps:
	@which ipfs-dumver >/dev/null || (echo "please install ipfs-dumver" && false)

clean:
	rm _src2.md
