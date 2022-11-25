#!/bin/bash

CURRENT=$(gsettings get org.gnome.settings-daemon.plugins.color night-light-temperature | awk '{ print $2 }')
NEXT=$((CURRENT - 500))
NEXT=$((NEXT < 1000 ? 1000 : NEXT))
NEXT=$((NEXT > 10000 ? 10000 : NEXT))
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature $NEXT
echo Night light template set to $NEXT
