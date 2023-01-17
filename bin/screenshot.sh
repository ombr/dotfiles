#!/bin/sh -e
cd
scrot -s -F '%Y-%m-%d-%H-%M-%S_$wx$h.png' -e 'optipng $f'
