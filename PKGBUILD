# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares-extensions
pkgver=0.6
_commit='cebdcaa19ac21a637fbc9da7a621f0eb08b0d846' # git rev-parse v${pkgver}
pkgrel=1
pkgdesc='Distribution-independent installer framework extensions'
arch=('x86_64')
license=(
    'GPL-3.0-or-later'
    'LGPL-2.1-only'
    'LGPL-3.0-or-later')
url="https://gitea.artixlinux.org/artix/calamares-extensions"
depends=('calamares' 'libcalamaresui.so' 'libcalamares.so' 'kdialog')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git' 'qt5-translations')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    mkdir -p "$pkgname"/build
    cd "$pkgname"/build
        cmake .. \
            -DCMAKE_PREFIX_PATH=/usr \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DINSTALL_CONFIG:BOOL=ON \
            -DBUILD_APPDATA:BOOL=OFF \
            -DBUILD_APPSTREAM:BOOL=OFF
        make
}

package() {
    make -C "$pkgname"/build DESTDIR="$pkgdir" install
}
