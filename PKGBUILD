# Maintainer: artist for Artix Linux

pkgname=copyq
pkgver=10.0.0
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'qt6-wayland' 'knotifications' 'kstatusnotifieritem')
makedepends=('extra-cmake-modules' 'qt6-tools' 'qt6-base' 'qt6-declarative')
license=('GPL3')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ffbae7a71c55cd89dfd88a6d184c7a5c7a8c4c948e9df11c10640c246d9c5f53')

build() {
    cmake -B build -S CopyQ-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

