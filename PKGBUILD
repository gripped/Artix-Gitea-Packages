# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: ronin <https://auris.artixlinux.org/ronin>

pkgname=lact-dinit
pkgver=20260429
pkgrel=1
pkgdesc='dinit init script for lact'
arch=('any')
url='https://auris.artixlinux.org/auris/packager/src/branch/lact-dinit/'
license=('BSD-2-Clause')
depends=('lact' 'dinit' 'dinit-base')
conflicts=('init-lact')
provides=('init-lact')
source=('lact')
sha256sums=('250694383639068a869d2e670fcff61876248da4cbba05b166feabea2c6764ee')

package() {
    install -Dm644 "${srcdir}/lact" "${pkgdir}/etc/dinit.d/lact"
}
