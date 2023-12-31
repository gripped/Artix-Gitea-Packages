# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares-extensions
pkgver=0.1
_commit='9e10e21381d808eb2ed24f33dd67203e6c241457' # git rev-parse v${pkgver}
pkgrel=1
pkgdesc='Distribution-independent installer framework extensions'
arch=('x86_64')
license=(GPL)
url="https://gitea.artixlinux.org/artix/calamares-extensions"
license=('LGPL')
depends=('calamares')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git' 'qt5-translations')
provides=('calamares-branding')
conflicts=('calamares-branding')
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
            -DBUILD_APPDATA:BOOL=OFF \
            -DBUILD_APPSTREAM:BOOL=OFF \
            -DINSTALL_CONFIG:BOOL=ON \
            -DSKIP_MODULES="refind packagechooserq"
        make
}

package() {
    make -C "$pkgname"/build DESTDIR="$pkgdir" install
}
