#!/usr/bin/python

import os
import random

import gi
gi.require_version("Gtk", "3.0")
# TODO: There's a warning to do something like this, but haven't figured out
# what the right function args are
# gi.require_version("AppIndicator3", "3.0")
from gi.repository import Gtk as gtk
from gi.repository import AppIndicator3 as appindicator


TEMPS = [
    1000,
    1500,
    2000,
    2500,
    3000,
    3500,
    4000,
    4500,
    5000,
]


def main():
    cur_path = os.path.dirname(os.path.realpath(__file__))

    # NOTE: The icon is coming from /usr/share/icons/*
    # Also See https://archlinux.org/packages/extra/any/gnome-icon-theme-symbolic/files/
    indicator = appindicator.Indicator.new(
        "customtray",
        "night-light-symbolic",
        appindicator.IndicatorCategory.APPLICATION_STATUS,
    )
    indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
    indicator.set_menu(menu())
    gtk.main()


def menu():
    menu = gtk.Menu()

    for temp in TEMPS:
        menu_item = gtk.MenuItem(label=f"{temp}")
        menu_item.connect("activate", set_temp)
        menu.append(menu_item)

    exittray = gtk.MenuItem(label="Exit")
    exittray.connect("activate", quit)
    menu.append(exittray)

    menu.show_all()
    return menu


def set_temp(menuItem: gtk.MenuItem):
    temp = int(menuItem.get_label())
    os.system(f'gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "uint32 {temp}"')


def quit(_):
    gtk.main_quit()


if __name__ == "__main__":
    main()
