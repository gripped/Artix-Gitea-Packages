# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares-extensions
pkgver=0.2
_commit='25acdeceba6bcea1d2d7b62d92cde7394e4108c1' # git rev-parse v${pkgver}
pkgrel=1
pkgdesc='Distribution-independent installer framework extensions'
arch=('x86_64')
license=(GPL)
url="https://gitea.artixlinux.org/artix/calamares-extensions"
license=('LGPL')
depends=('calamares' 'libcalamaresui.so' 'libcalamares.so')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git' 'qt5-translations')
provides=('calamares-branding')
conflicts=('calamares-branding')
replaces=('calamares-branding')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
sed -e 's|calamares_add_module_subdirectory( modules/packagechooserq LIST_SKIPPED_MODULES )|calamares_add_module_subdirectory( modules/packagechooserq LIST_SKIPPED_MODULES )\ncalamares_add_module_subdirectory( modules/packagechooserxq LIST_SKIPPED_MODULES )|' -i "$pkgname"/CMakeLists.txt
}

build() {
    mkdir -p "$pkgname"/build
    cd "$pkgname"/build
        cmake .. \
            -DCMAKE_PREFIX_PATH=/usr \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DINSTALL_CONFIG:BOOL=ON \
            -DBUILD_APPDATA:BOOL=OFF \
            -DBUILD_APPSTREAM:BOOL=OFF \
            -DSKIP_MODULES="refind"
        make
}

package() {
    make -C "$pkgname"/build DESTDIR="$pkgdir" install
}
