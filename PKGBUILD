# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-video-omap
pkgver=25.0.0
pkgrel=4
pkgdesc="XLibre fork of omap video driver"
arch=(x86_64)
license=('X11')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto' 'libdrm')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}
  export CFLAGS+=" -I/usr/include/omap"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --with-xorg-module-dir="/usr/lib/xorg/modules/xlibre-${pkgver%%.*}/"
  make
}

check() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('e3030c8506505af308bd6059477ba0a0186bbc99e1f270e9f7e5c62fb5ae0628')
