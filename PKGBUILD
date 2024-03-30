# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt6-graphs
_qtver=6.6.3
pkgver=${_qtver/-/}
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
             ninja
             qt6-shadertools)
groups=(qt6)
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('22c25c34a75a57398d65a449fe8492d8cfe000edc7378e78325f08ba8c56edde')

build() {
  cmake -B build -S $_pkgfn -G Ninja  -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
