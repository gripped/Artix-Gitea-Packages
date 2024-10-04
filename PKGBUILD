# Maintainer: artist for Artix Linux

pkgname=wlopm
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland output power management"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/wlopm"
license=('GPL-3.0-only')
depends=('wayland' 'wayland-protocols')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-v${pkgver}"
  make PREFIX='/usr' DESTDIR="$pkgdir"
}

package() {
  cd "${pkgname}-v${pkgver}"
  make install PREFIX='/usr' DESTDIR="$pkgdir"
}

sha256sums=('f9a7ec03a412e602420ab11d0eea872f6d30dfe5cfee93cd3d0289e4fbbb3aa1')
