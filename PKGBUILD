# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: éclairevoyant
# Contributor: endlesseden <eden at rose dot place>

pkgname=fast_float
pkgver=8.2.1
pkgrel=1
pkgdesc='Fast and exact implementation of the C++ from_chars functions for float and double types'
arch=('any')
url="https://github.com/fastfloat/fast_float"
license=('Apache-2.0 OR BSL-1.0 OR MIT')
makedepends=(
  'cmake'
  'doctest'
  'git'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('9ea980192acc5a9a6b67a591bc051aa9286a5074e904a8ad8e8f0637d898a6f966d99255b1bdb93d0a1c4cddcebc8f1bc803940123f6d0bd8a2cc0036981e24b')

build() {
  cmake -B build -S $pkgname \
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
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE-MIT
}
