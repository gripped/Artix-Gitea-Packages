# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=3.1.1
pkgrel=1.1
pkgdesc='Rapid fuzzy string matching in C++ using the Levenshtein Distance'
arch=('any')
url='https://github.com/maxbachmann/rapidfuzz-cpp'
license=('MIT')
depends=('cmake')
makedepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2227b61c56a37854336698e0649e8db6f0c5432f60f4501805cd16add3c6324f203788006d92e0271ec67a74916c5ac5a6290edbc7437ba2014fd25e6a0e415f')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -D RAPIDFUZZ_BUILD_TESTING=ON \
    -D RAPIDFUZZ_ENABLE_LINTERS=ON \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
