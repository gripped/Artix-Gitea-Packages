# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.0
pkgrel=5
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
license=(GPL)
url="https://github.com/calamares/calamares"
license=('LGPL')
depends=('bash' 'glibc' 'gcc-libs' 'hwinfo' 'icu' 'libxcrypt' 'libpwquality' 'parted' 'yaml-cpp'
        'qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-location' 'qt5-xmlpatterns'
        'kconfig5' 'kcoreaddons5' 'kcrash5' 'kparts5' 'kpackage5' 'plasma-framework5' 'kpmcore'
        'gtk-update-icon-cache' 'polkit-qt5' 'appstream-qt5' 'ckbcomp'
        'python-jsonschema' 'python-toml' 'python-pyyaml'
        'hicolor-icon-theme' 'artix-icons'
        )
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations')
optdepends=('calamares-branding: Artix branding')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        0001-add-netstrap-module.patch
        0001-add-services-dinit-module.patch
        0001-add-services-runit-module.patch
        0001-add-services-s6-module.patch
        0001-add-postcfg-module.patch
        )
sha256sums=('252f0097e3191ffc557b022f34ef23d24b939f1141efd483db0ab1ee9dc0fb76'
            '8242efbc7a3763abc1d89c4164dbebc424b72a1895d1ca1fe0f7a9c0b2b29357'
            '5a6096625e9af482b01033736b39da1a1e30d4f1857e471350bf12612aea8190'
            'ba24130f9e37fe39658ee5c2255a0f943711f3eb170e45969c42daa6a11a31bf'
            '3e5ce753b3fdfedea440e42932d3833f34ab5a16e176627afb0b6bf33374dfc7'
            '898769505f6587c363806afc09ea7a94de01759428f7a763f05848f141a41e40')

prepare() {
    cd $pkgname-$pkgver
    # patches here
    patch -Np 1 -i $srcdir/0001-add-netstrap-module.patch
    patch -Np 1 -i $srcdir/0001-add-services-dinit-module.patch
    patch -Np 1 -i $srcdir/0001-add-services-runit-module.patch
    patch -Np 1 -i $srcdir/0001-add-services-s6-module.patch
    patch -Np 1 -i $srcdir/0001-add-postcfg-module.patch

    # fix appstream-qt5 until qt6 default
    for f in CMakeLists.txt ItemAppStream.cpp Config.cpp; do
        sed -e "s/AppStreamQt/AppStreamQt5/" -i src/modules/packagechooser/"$f"
    done
    sed -e "s/AppStreamQt/AppStreamQt5/" -i src/modules/packagechooserq/CMakeLists.txt
}

build() {
    cd $pkgname-$pkgver

    mkdir -p build
    cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_PREFIX_PATH=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DINSTALL_CONFIG:BOOL=ON \
              -DINSTALL_POLKIT:BOOL=ON \
              -DBUILD_APPDATA:BOOL=ON \
              -DBUILD_APPSTREAM:BOOL=ON \
              -DSKIP_MODULES="initramfs \
                              initramfscfg services-systemd \
                              dummyprocess dummypython dummycpp dummypythonqt"
        make
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir" install

    sed -e 's|Icon.*=.*|Icon=artixlinux-logo|g' \
        -i "$pkgdir"/usr/share/applications/calamares.desktop
}
