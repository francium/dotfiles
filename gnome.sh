#!/bin/bash


# Background
# Solid
    # gsettings set  org.gnome.desktop.background   picture-uri         none
    # gsettings set  org.gnome.desktop.background   primary-color       '#FF0000'
    # gsettings set  org.gnome.desktop.background   color-shading-type  'solid'
# Gradient
    # gsettings set  org.gnome.desktop.background  color-shading-type  vertical # or horizontal
    # gsettings set  org.gnome.desktop.background  primary-color       "#000000"
    # gsettings set  org.gnome.desktop.background  secondary-color    "#1a0404"


# Workspaces
    gsettings set  org.gnome.mutter  workspaces-only-on-primary false

# Switch between windows current workspace only
    gsettings set  org.gnome.shell.window-switcher  current-workspace-only  true


# Shell
    gsettings set  org.gnome.desktop.interface clock-show-seconds       true
    gsettings set  org.gnome.desktop.interface enable-animations        false
    gsettings set  org.gnome.desktop.interface monospace-font-name      "'Source Code Pro Semi-Bold 7.5'"
    gsettings set  org.gnome.desktop.interface show-battery-percentage  true


# Text
    gsettings set  org.gnome.desktop.interface font-antialiasing "'rgba'"
    gsettings set  org.gnome.desktop.interface font-hinting "'medium'"


# Windows
    gsettings set  org.gnome.desktop.wm.preferences  button-layout          "'icon:minimize,maximize,close'"
    gsettings set  org.gnome.desktop.wm.preferences  mouse-button-modifier  "'<Alt>'"
    gsettings set  org.gnome.desktop.wm.preferences  resize-with-right-button true


# Audio
    gsettings set  org.gnome.desktop.sound  allow-volume-above-100-percent  true


# Power
    gsettings set  org.gnome.settings-daemon.plugins.power  idle-dim  false
    gsettings set  org.gnome.settings-daemon.plugins.power  sleep-inactive-ac-type  "'nothing'"
    gsettings set  org.gnome.settings-daemon.plugins.power  sleep-inactive-battery-type  "'nothing'"


# Night Light
    gsettings set  org.gnome.settings-daemon.plugins.color  night-light-enabled  true
# Enable it always to enable slider in shell panel
    gsettings set  org.gnome.settings-daemon.plugins.color  night-light-schedule-automatic  false
    gsettings set  org.gnome.settings-daemon.plugins.color  night-light-schedule-to         0.0
    gsettings set  org.gnome.settings-daemon.plugins.color  night-light-schedule-from       0.0


# Mouse
    gsettings set  org.gnome.desktop.peripherals.touchpad  send-events  "'disabled'"


# Keyboard
    gsettings set  org.gnome.desktop.peripherals.keyboard  delay  "uint32 200"
    gsettings set  org.gnome.desktop.input-sources  xkb-options  "['caps:escape_shifted_capslock']"


# Shortcuts
    gsettings set  org.gnome.desktop.wm.keybindings  move-to-monitor-left         "['<Super>comma']"
    gsettings set  org.gnome.desktop.wm.keybindings  move-to-monitor-right        "['<Super>period']"
    gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-right       "['<Shift><Super>j']"
    gsettings set  org.gnome.desktop.wm.keybindings  move-to-workspace-left         "['<Shift><Super>k']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-right       "['<Super>j']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-to-workspace-left     "['<Super>k']"

    gsettings set  org.gnome.desktop.wm.keybindings  begin-resize                 "['<Super>backslash']"
    gsettings set  org.gnome.desktop.wm.keybindings  minimize                     "['<Super>bracketleft']"
    gsettings set  org.gnome.desktop.wm.keybindings  toggle-fullscreen            "['<Super>f']"
    gsettings set  org.gnome.desktop.wm.keybindings  toggle-maximized             "['<Super>bracketright']"

# Gnome 40 removed vertical workspaces.
# Here for a while, can be removed eventually. Need to reset these to avoid
# conflict with another binding which would cause binding to not work
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-down
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-up
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-up
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-down
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-1
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-2
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-3
    gsettings reset  org.gnome.desktop.wm.keybindings  move-to-workspace-4
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-1
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-2
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-3
    gsettings reset  org.gnome.desktop.wm.keybindings  switch-to-workspace-4

# Fix alt-tab
    gsettings set  org.gnome.desktop.wm.keybindings  switch-windows               "['<Alt>Tab']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-applications          "[]"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-windows-backward      "['<Shift><Alt>Tab']"
    gsettings set  org.gnome.desktop.wm.keybindings  switch-applications-backward "[]"


# Custom shortcuts
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


# Nautilus

# Mac-like folder expansion (make sure 'sushi' is installed)
    gsettings set  org.gnome.nautilus.list-view  use-tree-view  true
