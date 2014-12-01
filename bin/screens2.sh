#!/bin/bash
xrandr --output LVDS2 --auto
sleep 1
xrandr --output DP-1-1 --auto --left-of LVDS2
