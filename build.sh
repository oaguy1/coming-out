#! /usr/bin/env bash

fennel --compile game.fnl > game.lua
fennel --compile mode/cw.fnl > mode/cw.lua
fennel --compile mode/menu.fnl > mode/menu.lua
fennel --compile mode/chat.fnl > mode/chat.lua

rm Coming\ Out.love
rm -rf web

zip -9 -x "dist/*" -x ".git/*" -r Coming\ Out.love .
love.js Coming\ Out.love web -c -t "Coming Out Story" -m 18783037
