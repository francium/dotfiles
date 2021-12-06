#!/bin/bash

sudo cryptsetup open disk-Callisto Callisto
sudo mount /dev/mapper/Callisto /media-backup/Callisto
sudo rsync -ahAE --delete --stats  --info=progress2 --progress /media/Io /media-backup/Callisto/Io-mirror
sudo umount /media-backup/Callisto
sudo cryptsetup close Callisto
sudo hdparm -Y disk-Callisto
