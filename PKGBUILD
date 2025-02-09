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
b2sums=('69b73e33b91ce24563f0931a02847d0e3d0253e457ca827f2224f80e4c390dcc639364e9fc8994d4e41489b0a2a9fa36cedbda45ea1c0ff1c8489c2f0b63f72e')

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
