# $Id$
# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20251121
pkgrel=1
pkgdesc="Artix mirror list for use by pacman"
arch=('any')
url="https://gitea.artixlinux.org/packages/artix-mirrorlist"
license=('GPL')
provides=('pacman-mirrorlist')
conflicts=('pacman-mirrorlist')
replaces=('pacman-mirrorlist')
backup=(etc/pacman.d/mirrorlist)
source=(mirrorlist)
sha256sums=('b497c892e987d55ef85100eb0407df5245b5ea4be3c0eaac110790fe901c8956')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d
  install -m644 "${srcdir}"/mirrorlist "${pkgdir}"/etc/pacman.d/
}
