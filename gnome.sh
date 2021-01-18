#!/bin/bash

# gsettings set  org.gnome.desktop.background   picture-uri         none
# gsettings set  org.gnome.desktop.background   primary-color       '#FF0000'
# gsettings set  org.gnome.desktop.background   color-shading-type  'solid'

gsettings set  org.gnome.desktop.background  color-shading-type  vertical # or horizontal
gsettings set  org.gnome.desktop.background  primary-color       "#000000"
gsettings set  org.gnome.desktop.background  secondary-color    "#1a0404"

gsettings set  org.gnome.mutter  workspaces-only-on-primary false

gsettings set  org.gnome.desktop.interface clock-show-seconds       true
gsettings set  org.gnome.desktop.interface enable-animations        false
gsettings set  org.gnome.desktop.interface monospace-font-name      "'Source Code Pro Semi-Bold 8'"
gsettings set  org.gnome.desktop.interface show-battery-percentage  true

gsettings set  org.gnome.desktop.sound  allow-volume-above-100-percent  true

gsettings set  org.gnome.settings-daemon.plugins.power  idle-dim  false
gsettings set  org.gnome.settings-daemon.plugins.power  sleep-inactive-ac-type  "'nothing'"
gsettings set  org.gnome.settings-daemon.plugins.power  sleep-inactive-battery-type  "'nothing'"

gsettings set  org.gnome.settings-daemon.plugins.xsettings  antialiasing  "'grayscale'"
gsettings set  org.gnome.settings-daemon.plugins.xsettings  hinting  "'slight'"

gsettings set  org.gnome.desktop.wm.preferences  button-layout          "'icon:minimize,maximize,close'"
gsettings set  org.gnome.desktop.wm.preferences  mouse-button-modifier  "'<Alt>'"

gsettings set  org.gnome.desktop.peripherals.touchpad  send-events  "'disabled'"

gsettings set  org.gnome.desktop.peripherals.keyboard  delay  "uint32 200"

gsettings set  org.gnome.desktop.input-sources  xkb-options  "['caps:escape_shifted_capslock']"

gsettings set  org.gnome.desktop.wm.keybindings  begin-resize                 "['<Super>backslash']"
gsettings set  org.gnome.desktop.wm.keybindings  minimize                     "['<Super>bracketleft']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-monitor-left         "['<Super>comma']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-monitor-right        "['<Super>period']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-1          "['<Shift><Super>exclam']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-2          "['<Shift><Super>at']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-3          "['<Shift><Super>numbersign']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-4          "['<Shift><Super>dollar']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-down       "['<Shift><Super>j']"
gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-up         "['<Shift><Super>k']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-1        "['<Super>1']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-2        "['<Super>2']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-3        "['<Super>3']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-4        "['<Super>4']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-down     "['<Super>j']"
gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-up       "['<Super>k']"
gsettings set  org.gnome.desktop.wm.keybindings  toggle-fullscreen            "['<Super>f']"
gsettings set  org.gnome.desktop.wm.keybindings  toggle-maximized             "['<Super>bracketright']"
# Fix alt-tab
    gsettings set  org.gnome.desktop.wm.keybindings  switch-windows               "['<Alt>Tab']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-applications          "[]"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-windows-backward      "['<Shift><Alt>Tab']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-applications-backward "[]"

# Switch between windows current workspace only
gsettings set  org.gnome.shell.window-switcher  current-workspace-only  true

CUSTOM_KEYBINDING="["\
"'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',"\
"'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/'"\
"]"
gsettings set  org.gnome.settings-daemon.plugins.media-keys  custom-keybindings $CUSTOM_KEYBINDING

MEDIA_KEYS_PREFIX=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding

gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/  binding  "'<Super>Return'"
gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/  command  "'gnome-terminal'"
gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/  name     "'Terminal'"

gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/  binding  "'<Super>e'"
gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/  command  "'nautilus'"
gsettings set  $MEDIA_KEYS_PREFIX:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/  name     "'Files'"
