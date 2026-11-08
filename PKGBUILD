# $Id$
# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20261108
pkgrel=1
pkgdesc="Artix mirror list for use by pacman"
arch=('any')
url="https://gitea.artixlinux.org/packages/artix-mirrorlist"
source=(mirrorlist)
license=('GPL')
provides=('pacman-mirrorlist')
conflicts=('pacman-mirrorlist')
replaces=('pacman-mirrorlist')
backup=(etc/pacman.d/mirrorlist)
sha256sums=('23d940aeeb872012af11a745b23d7e5b2eeafd9302d9d0b1a12dca7ce4f4223b')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d
  install -m644 "${srcdir}"/mirrorlist "${pkgdir}"/etc/pacman.d/
}
