# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Maarten Baert

pkgname=simplescreenrecorder
pkgver=0.4.4
pkgrel=3
pkgdesc="A feature-rich screen recorder that supports X11 and OpenGL."
arch=("x86_64")
url="https://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
depends=("qt5-base" "qt5-x11extras"
    "ffmpeg4.4" "alsa-lib" "libpulse" "jack" "libgl" "glu"
    "libx11" "libxext" "libxfixes" "libxi" "libxinerama"
    "desktop-file-utils" "gtk-update-icon-cache")
optdepends=("lib32-simplescreenrecorder: OpenGL recording of 32-bit applications")
makedepends=("git" "cmake" "qt5-tools")
source=("git+https://github.com/MaartenBaert/ssr.git#tag=$pkgver")
sha256sums=('SKIP')

install=simplescreenrecorder.install

build() {
  mkdir -p ssr/build
  cd ssr/build

  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"

  # fPIC is only required for qt5 + gcc5
  #CXXFLAGS="$CXXFLAGS -fPIC"
  #./configure --prefix=/usr --disable-assert --with-qt5
  #./configure --prefix=/usr --disable-assert
  #  -DLRELEASE='/usr/bin/lrelease-qt4' \
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release \
    -DWITH_QT5=on \
    -DCMAKE_INSTALL_LIBDIR='lib' ../
  make
}
package() {
  cd ssr/build
  make DESTDIR="$pkgdir" install
}
