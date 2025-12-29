# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-input-vmmouse
pkgver=25.0.0
pkgrel=5
pkgdesc="XLibre fork of X.Org VMWare Mouse input driver"
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
depends+=('libelogind')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
    --with-udev-rules-dir=/usr/lib/udev/rules.d
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  rm -rfv "${pkgdir}"/usr/{lib,share}/hal
}

sha256sums=('41c760d547989d0b120b76e299c2b2611f13fb063838fb6c3fa7fe26eb756fbe')
