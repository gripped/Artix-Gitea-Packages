#!/bin/bash

# rm-service.sh
# Indiscriminately removes all lines that contain ".service"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <package repo>"
    exit 1
else
    for arg in "$@"
    do
        sed -i '/\.service/d' "${arg}/PKGBUILD"
    done
fi
