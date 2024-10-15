# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt6-graphs
_pkgver=6.8.0
pkgver=6.8.0
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Qt Graphs for data visualization'
depends=(gcc-libs
         glibc
         qt6-base
         qt6-declarative
         qt6-quick3d)
makedepends=(cmake
             git
             ninja
             qt6-shadertools)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('e12a922e7491eadedf1c918a9211954d9902526bc0d7344374b0639c8a498ae8')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
