all: build less

less: _site/css/main.css

css/%.css: css/%.less
	lessc -x css/main.less > css/main.css

_site/css/%.css: css/%.css
	cp $< $@

build: css/main.css
	jekyll build

deploy: build less
	./deploy.sh

publish: deploy
	git push

deps: deps-jekyll deps-latex


deps-jekyll:
	gem install jekyll open4 redcarpet

deps-latex:
	brew install
