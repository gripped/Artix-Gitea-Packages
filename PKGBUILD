# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=wxwidgets
pkgname=(wxwidgets-common
         wxwidgets-gtk3
#        wxwidgets-gtk4 - doesn't build
         wxwidgets-qt)
pkgver=3.3.0
pkgrel=1
arch=(x86_64)
url='https://wxwidgets.org'
license=(custom:wxWindows)
makedepends=(cmake
             git
             glu
             gst-plugins-base
             gtk4
             libmspack
             libnotify
             nanosvg
             qt6-base
             sdl2
             webkit2gtk-4.1)
source=(git+https://github.com/wxWidgets/wxWidgets#tag=v$pkgver
        git+https://github.com/wxWidgets/scintilla
        git+https://github.com/wxWidgets/lexilla
        qt-6.9.patch)
sha256sums=('3826b01bddf3fc80bcb6b4b942968f6c028d0699a661e86c14dd06d320998e44'
            'SKIP'
            'SKIP'
            '9b2af48ed8beee7de1d2c1fc697e6442ad9347b4b1c81da6c7ff629f3dbe8f39')

prepare() {
  cd wxWidgets
  git submodule init
  git submodule set-url src/stc/scintilla "$srcdir"/scintilla
  git submodule set-url src/stc/lexilla "$srcdir"/lexilla
  git -c protocol.file.allow=always submodule update src/stc/scintilla src/stc/lexilla

  patch -p1 -i ../qt-6.9.patch
}

build() {
  cmake -B build-base -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxUSE_GUI=OFF \
    -DwxUSE_REGEX=sys\
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON
  cmake --build build-base

  cmake -B build-gtk3 -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys\
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON
  cmake --build build-gtk3

#   cmake -B build-gtk4 -S wxWidgets \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_BUILD_TYPE=None \
#     -DwxBUILD_TOOLKIT=gtk4 \
#     -DwxUSE_OPENGL=ON \
#     -DwxUSE_REGEX=sys\
#     -DwxUSE_ZLIB=sys \
#     -DwxUSE_EXPAT=sys \
#     -DwxUSE_LIBJPEG=sys \
#     -DwxUSE_LIBPNG=sys \
#     -DwxUSE_LIBTIFF=sys \
#     -DwxUSE_LIBLZMA=sys \
#     -DwxUSE_NANOSVG=sys \
#     -DwxUSE_LIBMSPACK=ON \
#     -DwxUSE_PRIVATE_FONTS=ON \
#     -DwxUSE_GTKPRINT=ON
#   cmake --build build-gtk4

  cmake -B build-qt -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=qt \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON
  cmake --build build-qt

# Run configure to generate the Makefile, cmake doesn't install translations
  cd wxWidgets
  ./configure --prefix=/usr --disable-tests
  make -C locale allmo
}

package_wxwidgets-common() {
  pkgdesc='Common libraries and headers for wxwidgets'
  depends=(bash
           curl
           gcc-libs
           glib2
           glibc
           expat
           pcre2
           xz
           zlib)
  conflicts=(wxgtk-common)
  replaces=(wxgtk-common)

  DESTDIR="$pkgdir" cmake --install build-qt
#   DESTDIR="$pkgdir" cmake --install build-gtk4
  DESTDIR="$pkgdir" cmake --install build-gtk3
  DESTDIR="$pkgdir" cmake --install build-base
  rm -r "$pkgdir"/usr/lib/{cmake,wx/{3*,include,config/{gtk*,qt*}},libwx_{gtk,qt}*}
  install -Dm644 wxWidgets/wxwin.m4 -t "$pkgdir"/usr/share/aclocal
  mv "$pkgdir"/usr/bin/wx-config{,-base} # Conflicts with wx-gtk3

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-gtk3() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=(cairo
           fontconfig
           gcc-libs
           gdk-pixbuf2
           glib2
           glibc
           gst-plugins-bad-libs
           gstreamer
           gtk3
           libglvnd
           libjpeg-turbo
           libnotify
           libmspack
           libpng
           libtiff
           libwebp
           libx11
           libxkbcommon
           libxtst
           pango
           sdl2
           wayland
           wxwidgets-common)
  optdepends=('webkit2gtk-4.1: for webview support')

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,share,bin/wxrc*}
  
  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package_wxwidgets-gtk4() {
#   pkgdesc='GTK+4 implementation of wxWidgets API for GUI'
#   depends=(bash
#            cairo
#            fontconfig
#            gcc-libs
#            gdk-pixbuf2
#            glib2
#            glibc
#            gtk4
#            libglvnd
#            libjpeg-turbo
#            libnotify
#            libmspack
#            libpng
#            libsm # cmake target
#            libtiff
#            libx11
#            libxkbcommon
#            libxtst
#            pango
#            sdl2
#            wayland
#            wxwidgets-common)
#   optdepends=('webkit2gtk-4.1: for webview support')
# 
#   DESTDIR="$pkgdir" cmake --install build-gtk4
#   rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*,share}
#   mv "$pkgdir"/usr/bin/wx-config{,-gtk4} # Conflicts with wx-gtk3
#   
#   install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
# }

package_wxwidgets-qt() {
  pkgdesc='Qt6 implementation of wxWidgets API for GUI'
  depends=(bash
           gcc-libs
           glibc
           libglvnd
           libjpeg-turbo
           libmspack
           libpng
           libtiff
           libwebp
           qt6-base
           sdl2
           wxwidgets-common)

  DESTDIR="$pkgdir" cmake --install build-qt
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*,share}
  mv "$pkgdir"/usr/bin/wx-config{,-qt} # Conflicts with wx-gtk3
# Rename cmake files for coinstallability
  mv "$pkgdir"/usr/lib/cmake/wxWidgets{,Qt}
  for _f in "$pkgdir"/usr/lib/cmake/wxWidgetsQt/*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsQt/')
  done

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
