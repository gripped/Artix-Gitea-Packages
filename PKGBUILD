# Maintainer:  Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: pootzko <pootzko at gmail dot com>

pkgname=haveged
pkgver=1.9.26
pkgrel=1
pkgdesc='Entropy harvesting daemon using CPU timings'
arch=('x86_64')
url='https://github.com/jirka-h/haveged'
license=('GPL-3.0-or-later')
depends=('glibc')
validpgpkeys=('8F6B7293B03E5AC5762B65CE2E2F252B05CCA168') # Jirka Hladky <hladky.jiri@gmail.com>
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirka-h/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('74bc6052506451ca9f23ba186f72cf81b124f859351f8a4b777ead32d9bdd4da')

build() {
  cd $pkgname-$pkgver

  ./configure \
      --prefix=/usr \
      --bindir=/usr/bin \
      --sbindir=/usr/bin
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
