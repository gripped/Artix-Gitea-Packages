# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.0
pkgrel=2
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
license=(GPL)
url="https://github.com/calamares/calamares"
license=('LGPL')
depends=('yaml-cpp' 'kpmcore>=3.1.0' 'hwinfo' 'gtk-update-icon-cache' 'qt5-location' 'kparts5'
          'libpwquality' 'polkit-qt5' 'qt5-xmlpatterns' 'plasma-framework5' 'python-jsonschema')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations')
optdepends=('calamares-branding: Artix branding')
source=("${url}/archive/v$pkgver.tar.gz"
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
}

build() {
    cd $pkgname-$pkgver

    mkdir -p build
    cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DINSTALL_CONFIG:BOOL=ON \
              -DINSTALL_POLKIT:BOOL=ON \
              -DSKIP_MODULES="initramfs \
                              initramfscfg services-systemd \
                              dummyprocess dummypython dummycpp dummypythonqt"
        make
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir" install
}
