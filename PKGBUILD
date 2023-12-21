# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.0
pkgrel=1
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
        postcfg.patch
        services-runit.patch
        services-s6.patch
        services-dinit.patch)
sha256sums=('252f0097e3191ffc557b022f34ef23d24b939f1141efd483db0ab1ee9dc0fb76'
            '77c2d46c511ad6ea4f2c9663007f9d5a4cc2c385223498982d3feb4e56becc68'
            '820d515f5788b7b55e3ebaa2357db643bc1d554e931649980d8b39a6a26b51e0'
            '659c37cbc9f8fb29612aaf336ffc0b2a380cce7c0b6b065506a449465b11538b'
            'e8fe3bd2204a527409e495f23bf9c59098d97c5d21afd97006a81ff4fc414e24')

prepare() {
    cd $pkgname-$pkgver
    # patches here
    patch -Np 1 -i $srcdir/postcfg.patch
    patch -Np 1 -i $srcdir/services-runit.patch
    patch -Np 1 -i $srcdir/services-s6.patch
    patch -Np 1 -i $srcdir/services-dinit.patch
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
