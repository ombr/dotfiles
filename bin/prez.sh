#!/bin/bash
xrandr --output DP-0 --auto
sleep 1
xrandr --output LVDS-1-0 --auto --right-of DP-0
