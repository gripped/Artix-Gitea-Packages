# Maintainer: artist for Artix Linux

pkgname=wf-config
pkgver=0.9.0
pkgrel=2.1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=('x86_64')
url="https://github.com/WayfireWM/wf-config"
license=('MIT')
depends=('libevdev' 'libxml2')
makedepends=('wlroots' 'meson' 'ninja' 'wayland-protocols' 'glm' 'doctest' 'cmake')
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "${pkgname}-${pkgver}"
  artix-meson build
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir/" ninja -C build install
}

sha256sums=('f681fe028aa9026e0c6894d7b94c544230b8285078f176076a3d964fd1dfc37b')

