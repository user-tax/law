#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

bun run i18n -- -d doc zh
cd doc

li=$(fd --extension md --type file --hidden --exclude .git)

sd -s "＃" "#" $li
sd -s "# #" "##" $li
sd "^(\s*)1.([^\s])" '${1}1. $2' $li
sd "^(\s*)\*([^\s])" '${1}* $2' $li
sd "^(#+)([^\s#])" '$1 $2' $li
sd -s "___" '__' $li
sd "^__([^\s])" '__ $1' $li
sd "([^\s])__$" '$1 __' $li

cd $DIR
./up.coffee
