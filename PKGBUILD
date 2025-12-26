# Maintainer: artist for Artix Linux

pkgname=xlibre-input-joystick
pkgver=25.0.0
pkgrel=3
pkgdesc="XLibre fork of X.Org joystick input driver for the XLibre X server"
arch=(x86_64)
license=('custom')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')
options=('!debug')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -Dvm644 README.md "${pkgdir}/usr/share/doc/xlibre-${_pkgname}/README.md"
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/xlibre-${_pkgname}/COPYING"
}
sha256sums=('af821e11477d8c1bdb08ee2cbadfd556159d42b394699b2c980aa5c818441520')

