# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix
pkgver=3.4.10
pkgrel=3.1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL-2.0-or-later')
depends=(
    'desktop-file-utils'
    'librsvg'
    'gst-plugins-base-libs'
    'gsettings-desktop-schemas'
    'libwebp'
    'xapp'
)
makedepends=(
    'meson'
    'intltool'
    'itstool'
    'liboauth'
    'exiv2'
    'glib2-devel'
)
optdepends=(
    'gstreamer: Video support'
    'gst-plugin-gtk: Video support'
    'gst-libav: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'dcraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums'
    'libchamplain: Map Viewer'
    'libheif: heif/heic/avif file support'
    'yelp: View help and documentation from the app'
    'webkit2gtk-4.1: Web services support'
)
provides=($pkgname)
conflicts=('pix-git')
url='https://github.com/linuxmint/pix'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")

build() {
    mkdir -p "${srcdir}"/${pkgname}-${pkgver}/build
    cd "${srcdir}"/${pkgname}-${pkgver}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..

    ninja
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR="$pkgdir/" ninja install
}

sha256sums=('d765e779ee6e7d8220fe556c010c181ae69be059d53192d628f5bec5fdc9082b')
