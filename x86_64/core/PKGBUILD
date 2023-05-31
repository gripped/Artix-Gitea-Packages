# $Id$
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20230528
pkgrel=2
pkgdesc="Artix mirror list for use by pacman"
arch=('any')
url="https://gitea.artixlinux.org/packagesA/artix-mirrorlist/src/branch/master/trunk/mirrorlist"
license=('GPL')
provides=('pacman-mirrorlist')
conflicts=('pacman-mirrorlist')
replaces=('pacman-mirrorlist')
backup=(etc/pacman.d/mirrorlist)
source=(mirrorlist)
sha256sums=('4bd656d2cdab64e27f1c0d61c0a9aa03ecef2f4de9ff89b9927f19af74997970')

package() {
  mkdir -p $pkgdir/etc/pacman.d
  install -m644 $srcdir/mirrorlist $pkgdir/etc/pacman.d/
}
