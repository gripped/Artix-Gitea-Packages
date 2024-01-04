# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares-extensions
pkgver=0.4
_commit='15a16009742147a729aa1bb189ca4fb0d9621803' # git rev-parse v${pkgver}
pkgrel=1
pkgdesc='Distribution-independent installer framework extensions'
arch=('x86_64')
license=(GPL)
url="https://gitea.artixlinux.org/artix/calamares-extensions"
license=('LGPL')
depends=('calamares' 'libcalamaresui.so' 'libcalamares.so')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git' 'qt5-translations')
provides=('calamares-branding')
replaces=('calamares-branding')
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
