# $Id$
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20240507
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
sha256sums=('b908dc015eaf7641741cc203062d9ba8a7e4a7661665a1b79a5633c2e42e6192')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d
  install -m644 "${srcdir}"/mirrorlist "${pkgdir}"/etc/pacman.d/
}
