# Maintainer: artist for Artix Linux

pkgname=copyq
pkgver=9.1.0
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'qt6-wayland' 'knotifications' 'kstatusnotifieritem')
makedepends=('extra-cmake-modules' 'qt6-tools' 'qt6-base' 'qt6-declarative')
license=('GPL3')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S CopyQ-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

