# $Id$
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>
# Contributor: Carlos Torres <torr@artixlinux.org>

pkgname=artix-mirrorlist
pkgver=20240724
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
sha256sums=('4cc6baabd6aea9b13b925d92cadae9b28af7666eb9b7ccdd59f93921404810da')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d
  install -m644 "${srcdir}"/mirrorlist "${pkgdir}"/etc/pacman.d/
}
