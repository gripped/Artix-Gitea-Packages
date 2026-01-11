# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_commit=bc77da07495cf5c6815de692aa25228ee6d768ea

pkgname=calamares-extensions
pkgver=0.16
pkgrel=7
pkgdesc='Distribution-independent installer framework extensions'
arch=('x86_64')
license=(
    'GPL-3.0-or-later'
    'LGPL-2.1-only'
    'LGPL-3.0-or-later')
url="https://gitea.artixlinux.org/artix/calamares-extensions"
depends=('bash' 'gcc-libs' 'glibc' 'python' 'qt6-base' 'qt6-declarative')
makedepends=('extra-cmake-modules' 'qt6-tools' 'git' 'qt6-translations' 'calamares' 'kdialog')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
        cmake -S "$pkgname" -B build \
            -DCMAKE_PREFIX_PATH=/usr \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DCMAKE_INSTALL_SYSCONFDIR=/etc \
            -DCMAKE_INSTALL_DATADIR=/usr/share \
            -DINSTALL_CONFIG:BOOL=ON \
            -DWITH_QT6:BOOL=ON \
            -DWITH_QML:BOOL=ON \
            -DBUILD_APPDATA:BOOL=OFF \
            -DBUILD_APPSTREAM:BOOL=OFF
        cmake --build build
}

package() {
    depends+=('calamares' 'kdialog')

    DESTDIR="$pkgdir" cmake --install build
}
