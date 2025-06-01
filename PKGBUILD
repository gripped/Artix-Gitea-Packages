# Maintainer: artist for Artix Linux

pkgname=wayvnc
pkgver=0.9.1
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(ISC)
depends=(
  glibc
  jansson
  libaml.so
  libdrm
  libneatvnc.so
  libpixman-1.so
  libxkbcommon.so
  wayland
)
makedepends=(
  meson
  ninja
  pam
  scdoc
)
optdepends=('pam: PAM authentication')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        LICENSE)
b2sums=('64702ff290776eb2fde8002615c791853d1158465229a3136655c05de50f34f1214c851888679c1e1949500c90aaa51ce460b07fc5658edf043eff0d46971c2d'
        'c0afb2f05920179b4dc49c46e682244866f8c053a720b5ef93a9939ae721405d340741e15b05e9ea7dc8874111562cd932de2d6ac305589760119307a5f543d5')

build() {
  artix-meson "${pkgname}-${pkgver}" build \
    -Dman-pages=enabled \
    -Dpam=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

