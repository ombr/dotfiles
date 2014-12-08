#!/bin/bash
xrandr --output DP-0 --off
sleep 1
xrandr --output LVDS1 --auto
sleep 2
xrandr --output DP-0 --auto --right-of LVDS1
