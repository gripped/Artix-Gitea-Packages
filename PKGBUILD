# Maintainer: artist for Artix Linux

pkgname=xlibre-video-voodoo
_pkgname=xf86-video-voodoo
pkgver=1.2.6.2
pkgrel=1.2
pkgdesc="XLibre fork of X.Org 3dfx Voodoo1/Voodoo2 2D video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
depends=('glibc')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0' 'xorgproto')
conflicts=("xlibre-${_pkgname}" 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
provides=("xlibre-${_pkgname}" "${_pkgname}")
replaces=("xlibre-${_pkgname}")
groups=('xlibre-drivers')
source=("${url}/${_pkgname}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('acdea470f57d33c27a4b1bbb18568a950ac344230e5a9a2ee57ad99f09acc97a')
