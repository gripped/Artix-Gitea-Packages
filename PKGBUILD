# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=2.9.3
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(sh)
makedepends=(git)
source=(git+https://github.com/funtoo/keychain#tag=$pkgver)
sha256sums=('342246e81ccdc4b2c3e811cce8e4cff23ece86c327456dd18d80c8dfa1f3d8ae')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain "$pkgdir"/usr/bin/keychain
  install -Dm644 keychain.1 "$pkgdir"/usr/share/man/man1/keychain.1
}
