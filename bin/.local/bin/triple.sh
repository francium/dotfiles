# For some reason, had to use DP-1 when 3 displays connected. see `xrandr` for
# which displays are connected
xrandr --output eDP-1 --fb 5760x1080 --mode 1920x1080 --scale 1x1 \
       --output DP-1 --scale 1x1 --pos 1920x0 \
       --output HDMI-2 --pos 3840x0
