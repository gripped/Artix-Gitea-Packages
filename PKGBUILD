# Maintainer: artist for Artix Linux

pkgname=xlibre-video-neomagic
pkgver=25.0.0
pkgrel=3
pkgdesc="XLibre fork of neomagic video driver"
arch=(x86_64)
license=('X11')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./autogen.sh
  ./configure --prefix=/usr
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

sha256sums=('6b539cd3359e10fbf0b344bef16037f3a7a1a60a1f0f305f83032149ace6adba')
