all: less

less: css/main.css

css/%.css: css/%.less
	lessc -x css/main.less > css/main.css
	cp css/main.css _site/css/main.css
