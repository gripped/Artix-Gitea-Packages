# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry
pkgver=1.0.18
pkgrel=4
pkgdesc='A music player aimed at audio enthusiasts and music collectors'
arch=(x86_64)
url='https://www.strawbs.org/'
license=(GPL3)
depends=(abseil-cpp
         alsa-lib
         chromaprint
         fftw
         gcc-libs
         gdk-pixbuf2
         glib2
         glibc
         gnutls
         gst-plugins-base
         gst-plugins-base-libs
         gst-plugins-good 
         gstreamer
         icu
         libcdio
         libgpod
         libmtp
         libpulse
         libx11
         protobuf
         qt6-base
         sqlite
         taglib
         udisks2)
makedepends=(boost
             cmake
             qt6-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=(https://github.com/strawberrymusicplayer/strawberry/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('8687463b3c5c6d4344ab295ed0946b56d279b7e45875eb4fcca521ca1218c860')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
