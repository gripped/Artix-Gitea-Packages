# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=2.9.4
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(sh)
makedepends=(git)
source=(git+https://github.com/funtoo/keychain#tag=$pkgver)
sha256sums=('f91c84044e77b3393d0a5149b5d79c2632cd1fb062deb00d19e34bb8c09c355a')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain "$pkgdir"/usr/bin/keychain
  install -Dm644 keychain.1 "$pkgdir"/usr/share/man/man1/keychain.1
}
