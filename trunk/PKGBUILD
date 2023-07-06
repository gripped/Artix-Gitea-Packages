# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix
pkgver=3.0.1
pkgrel=1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=(
    'desktop-file-utils'
    'librsvg'
    'clutter-gtk'
    'gst-plugins-base-libs'
    'gsettings-desktop-schemas'
    'libwebp'
    'webkit2gtk'
    'xapp'
)
makedepends=(
    'meson'
    'intltool'
    'itstool'
    'liboauth'
    'exiv2'
)
optdepends=(
    'gstreamer: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'dcraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums'
    'libchamplain: Map Viewer'
    'libheif: heif/heic/avif file support'
)
provides=($pkgname)
conflicts=('pix-git')
url='https://github.com/linuxmint/pix'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz"
        "exiv2-0.28.patch")
md5sums=('05f2f55907e3a4f2f5ce8b5addf84d81'
         'ab9c92cde703d7d8d3ae194ae78520ca')


build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}"/exiv2-0.28.patch

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
