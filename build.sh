#! /usr/bin/env bash

fennel --compile game.fnl > game.lua
fennel --compile mode/cw.fnl > mode/cw.lua
fennel --compile mode/menu.fnl > mode/menu.lua
fennel --compile mode/chat.fnl > mode/chat.lua
