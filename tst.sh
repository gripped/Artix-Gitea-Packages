#!/bin/bash
for subdir in * ; do 
 if [ -d $subdir ]; then 
  pkgline=$(grep '^pkgname=' PKGBUILD)
  if [[ $pkgline == *"$subdir"* ]]; then
   echo $subdir;
  fi
 fi;
 done
