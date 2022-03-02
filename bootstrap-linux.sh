#!/bin/bash

mkdir -p ~/.gnupg
echo "pinentry-program /usr/bin/pinentry-gnome3" > ~/.gnupg/gpg-agent.conf
