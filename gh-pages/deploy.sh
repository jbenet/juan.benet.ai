#!/bin/sh
echo '==> deploying website'
git checkout -b deploy
make clean
make
git add -f _site/
git commit -m "payload"
git checkout master
git filter-branch --subdirectory-filter _site/ -f deploy
git push -f origin deploy:gh-pages
git branch -D deploy
