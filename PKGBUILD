# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Justin Gottula <justin@jgottula.com>

pkgname=wsdd
pkgver=0.9
pkgrel=2
pkgdesc="Web Services Dynamic Discovery daemon for Windows discovery and discoverability"
url="https://github.com/christgau/wsdd"
arch=(any)
license=(MIT)
depends=(
  python
  python-defusedxml
)
makedepends=(git)
backup=(etc/conf.d/wsdd)
source=(
  "git+$url?signed#tag=v$pkgver"
)
b2sums=('7ab80fa6b00eed0f4ca56fbf1a4b4fd4d749811d12ca7b021cba713145891a4e446168f1868c570b7e1b301f7f2c2defdc228436b7c9bcb9a1bf0d0c0235f325')
validpgpkeys=(
  55147D9E2AD7D45CC252F1C530462C9368BAB499 # Steffen Christgau <mail@s14u.de>
)

prepare() {
  cd wsdd
}

package() {
  cd wsdd
  install -D src/wsdd.py "$pkgdir/usr/bin/wsdd"
  install -Dm644 AUTHORS README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 etc/firewalld/services/* -t "$pkgdir/usr/lib/firewalld/services"
  install -Dm644 man/wsdd.8 -t "$pkgdir/usr/share/man/man8"
}

# vim:set sw=2 sts=-1 et:
