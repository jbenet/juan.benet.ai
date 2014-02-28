#!/bin/sh
cp -r _site _site_deploy
cd _site_deploy
git init
git add .
git commit -m "deploy"
git push -f git@github.com:jbenet/jbenet.github.com.git master
cd ..
rm -rf _site_deploy
