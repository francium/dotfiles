#!/bin/bash

# Setup multiDPI mutlimonitor display

# TODO Maybe it is possible to using a frame buffer of 256x1440 for the 1440p monitor instead of 3840x2160 by using a different scaling factor and setting the fame buffer explictly for eDP-1

# When the scale is set to 1.5 on eDP-1, the resolution in the frame buffer becomes 3840x2160.
# This means the frame buffer itself must now be (3840) + (2 * 1920) wide and 2160 high.
# The (2 * 1920) is because the frame buffer for HDMI-2 is 3840x2160 actually.
# See, https://askubuntu.com/questions/393400/is-it-possible-to-have-two-different-dpi-configurations-for-two-different-screen, for more details
xrandr --output eDP-1 --auto --scale 1.5x1.5 \
       --output HDMI-2 --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 3840x0

