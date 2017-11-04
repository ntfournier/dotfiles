#!/bin/bash
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
source ~/.profile

npm install -g jshint diff-so-fancy jasmine grunt gulp
