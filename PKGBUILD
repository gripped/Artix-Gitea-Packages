# $Id$
# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20261020
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
sha256sums=('b7154d13412e6fd1c5d09bf8a2d574bbc6d55c6e8712211be0be9f48993887ab')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d
  install -m644 "${srcdir}"/mirrorlist "${pkgdir}"/etc/pacman.d/
}
