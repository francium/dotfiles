#!/bin/bash

sudo cryptsetup open disk-Europa Europa
sudo mount /dev/mapper/Europa /media-backup/Europa
sudo rsync -ahAE --delete --stats  --info=progress2 --progress /media/Io /media-backup/Europa/Io-mirror
sudo umount /media-backup/Europa
sudo cryptsetup close Europa
sudo hdparm -Y disk-Europa
