#!/bin/sh

curl -H "Authorization: token $(sed -n "s/.*GIT_TOKEN='\([^']*\)'.*/\1/p" ~/.config/artools/artools-pkg.conf)" https://gitea.artixlinux.org/Tracker/Mirrors/raw/branch/master/mirrorlist -so mirrorlist
updpkgsums
