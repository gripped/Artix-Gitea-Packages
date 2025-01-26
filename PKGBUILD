# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares-extensions
pkgver=0.14
_commit=d24d23902c97a7205cdf4cb663fcc63f0e39f788
pkgrel=3
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
