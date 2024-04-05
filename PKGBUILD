# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt6-graphs
_qtver=6.7.0
pkgver=${_qtver/-/}
pkgrel=1.1
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
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('72737905a5dc59031334736ad1dbfbbd8aa53290bdf0ed5c070bc66e0d440b0d')

build() {
  cmake -B build -S $_pkgfn -G Ninja -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
