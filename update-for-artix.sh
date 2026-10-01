#!/bin/bash

echo "===> Replacing arch with artix and updating sha256sums"
sed -i s/archlinux/artixlinux/g config*
OLDCFGSUM=$(grep -F 'sha256sums[${i}]' PKGBUILD | grep -oE '[0-9a-f]{64}')
NEWCFGSUM=$(sha256sum config | cut -d' ' -f1)
sed -i "s/${OLDCFGSUM}/${NEWCFGSUM}/g" PKGBUILD   # replaces both occurrences (main array + literal check)
NEWSUM_I686=$(sha256sum config.i686 | cut -d' ' -f1)
NEWSUM_I486=$(sha256sum config.i486 | cut -d' ' -f1)
NEWSUM_P4=$(sha256sum config.pentium4 | cut -d' ' -f1)
sed -i "s/sha256sums_pentium4=('[0-9a-f]*')/sha256sums_pentium4=('${NEWSUM_P4}')/" PKGBUILD
sed -i "s/sha256sums_i686=('[0-9a-f]*')/sha256sums_i686=('${NEWSUM_I686}')/" PKGBUILD
sed -i "s/sha256sums_i486=('[0-9a-f]*')/sha256sums_i486=('${NEWSUM_I486}')/" PKGBUILD

sed -i s/HOST=archlinux/HOST=artixlinux/g PKGBUILD
