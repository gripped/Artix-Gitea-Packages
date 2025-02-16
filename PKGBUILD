# Maintainer: artist for Artix Linux

pkgname=wlopm
pkgver=1.0.0
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
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  cd "${pkgname}-v${pkgver}"
  make install PREFIX='/usr' DESTDIR="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}

sha256sums=('15f31bbd855131943397dded3a26003f2f5056e4c6a1a93d35ff7697b3f1e439')
