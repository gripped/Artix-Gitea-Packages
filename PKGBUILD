# Maintainer:  Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: pootzko <pootzko at gmail dot com>

pkgname=haveged
pkgver=1.9.23
pkgrel=1
pkgdesc='Entropy harvesting daemon using CPU timings'
arch=('x86_64')
url='https://github.com/jirka-h/haveged'
license=('GPL-3.0-or-later')
depends=('glibc')
validpgpkeys=('8F6B7293B03E5AC5762B65CE2E2F252B05CCA168') # Jirka Hladky <hladky.jiri@gmail.com>
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirka-h/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('376c9d6530c53274c5eadf220ae43d0658e15414150ea52711142f6743bbfd74')

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
