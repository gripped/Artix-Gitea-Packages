# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgbase=fltk
pkgname=(fltk fltk-docs)
pkgver=1.4.3
pkgrel=1
pkgdesc="Graphical user interface toolkit for X"
arch=(x86_64)
license=('LGPL-2.0-only WITH FLTK-exception')
url="https://www.fltk.org/"
makedepends=(
  alsa-lib
  cmake
  doxygen
  fontconfig
  glu
  libglvnd
  libjpeg-turbo
  libpng
  libx11
  libxcursor
  libxfixes
  libxft
  libxinerama
  libxrender
  mesa
)
source=(https://github.com/$pkgbase/$pkgbase/archive/release-$pkgver/$pkgbase-release-$pkgver.tar.gz)
sha512sums=('4793b2d277792c7b840ec1e76eaed231548eec68d57a14f80ae292718d14541f1d1b7b335c3600809b3536014038aa70765e81e91bd688563debd95ff21d76df')
b2sums=('441b89417a5e22d468834caceb6eae081e0a566c7110951c5ee9e9340f4ba874207b231a7debd1368f54bc4aa7c76dd3e0ce529701b16b870cb3c1e5b485a7db')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D FLTK_LIBDIR=/usr/lib
    -D FLTK_BUILD_SHARED_LIBS=ON
    -D FLTK_BUILD_HTML_DOCS=ON
    -D FLTK_INSTALL_HTML_DOCS=ON
    -S $pkgbase-release-$pkgver
    -W no-dev
  )

  # fat-lto-objects is required for non-mangled .a files in fltk
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
  # build documentation explicitly as it is otherwise not generated/ installed
  make VERBOSE=1 -C build/documentation html
}

package_fltk() {
  depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    fontconfig libfontconfig.so
    libglvnd
    libjpeg-turbo
    libpng
    libx11
    libxcursor
    libxext
    libxfixes
    libxft
    libxinerama
    libxrender
    sh
  )
  provides=(
    libfltk_images.so
    libfltk_gl.so
    libfltk_forms.so
    libfltk.so
  )
  options=(
    !docs
    staticlibs
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgbase-release-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove man pages of examples
  rm -rvf "$pkgdir/usr/share/man/man6"

  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc/$pkgname/html
  )
}

package_fltk-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-release-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
