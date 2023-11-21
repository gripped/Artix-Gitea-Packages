# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.17.5
pkgrel=1
pkgdesc='An HEIF and AVIF file format decoder and encoder'
arch=(x86_64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
makedepends=(cmake
             dav1d
             gdk-pixbuf2
             libjpeg
             libpng
             rav1e
             svt-av1)
depends=(aom
         gcc-libs
         glibc
         libde265
         libwebp
         x265)
optdepends=('libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc'
            'dav1d: dav1d encoder'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DAV1D=ON \
    -DWITH_RAV1E=ON \
    -DWITH_SvtEnc=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
