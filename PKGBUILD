# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: éclairevoyant
# Contributor: endlesseden <eden at rose dot place>

pkgname=fast_float
pkgver=8.0.0
pkgrel=1
pkgdesc='Fast and exact implementation of the C++ from_chars functions for float and double types'
arch=('any')
url="https://github.com/fastfloat/$pkgname"
license=('Apache-2.0 OR BSL-1.0 OR MIT')
makedepends=(
  'cmake'
  'doctest'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c5fc7696da59cfb000cb7a7356605cc06d30a245a4e87800434b2a915f19efa056a206de83b917df0cdae59723f6c0ef38d19a0b78de80eacb00aebd0aba7b6e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DFASTFLOAT_TEST=ON \
    -DSYSTEM_DOCTEST=ON
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE-MIT
}
