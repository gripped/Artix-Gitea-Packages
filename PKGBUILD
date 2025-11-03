# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=2.9.8
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(sh)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('5cf08d62acfc08a8213d7a94a28beecf6204db67d57d36c2dfda08fdd944a5a8')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain "$pkgdir"/usr/bin/keychain
  install -Dm644 keychain.1 "$pkgdir"/usr/share/man/man1/keychain.1
  make DESTDIR="$pkgdir/" PREFIX=/usr install-completions
}
