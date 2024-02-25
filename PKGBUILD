# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix
pkgver=3.2.2
pkgrel=3
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
    'gst-plugin-gtk: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'dcraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums'
    'libchamplain: Map Viewer'
    'libheif: heif/heic/avif file support'
    'yelp: View help and documentation from the app'
)
provides=($pkgname)
conflicts=('pix-git')
url='https://github.com/linuxmint/pix'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz"
'0001-jxl-added-support-for-version-0.9.0.patch'
)

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}"/0001-jxl-added-support-for-version-0.9.0.patch
}

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
sha256sums=('fec1a2750e3c903794f902b7a1f24cb6737e391e331470cc46f7bab2cbe1753a'
            'eb5b70c42613ede80b20eba17449ffc7fde72de86ad65cb61a75a32de7655f2d')
