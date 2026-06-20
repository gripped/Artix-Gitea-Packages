# Maintainer:  Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: pootzko <pootzko at gmail dot com>

pkgname=haveged
pkgver=1.9.24
pkgrel=1
pkgdesc='Entropy harvesting daemon using CPU timings'
arch=('x86_64')
url='https://github.com/jirka-h/haveged'
license=('GPL-3.0-or-later')
depends=('glibc')
validpgpkeys=('8F6B7293B03E5AC5762B65CE2E2F252B05CCA168') # Jirka Hladky <hladky.jiri@gmail.com>
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirka-h/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('76f2f77547e4b7dafe78352b4c96fa27cd6f03afc7cecf2ed37c7c7b32b679d7')

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
