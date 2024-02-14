# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt6-graphs
_qtver=6.6.2
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
sha256sums=('46ac2dedbf76807c2a44a438db772e4ab44fd25ce4d285316f9ab2dc6f8349a6')

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
