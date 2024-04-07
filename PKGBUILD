# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libpwquality
pkgver=1.4.5
pkgrel=4
pkgdesc='Library for password quality checking and generating random passwords'
arch=('x86_64')
url='https://github.com/libpwquality/libpwquality'
license=('BSD-3-Clause OR GPL-2.0-or-later')
depends=('cracklib' 'glibc' 'pam')
optdepends=('python: Python bindings')
makedepends=('python-setuptools')
backup=('etc/security/pwquality.conf')
source=("https://github.com/libpwquality/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('6fcf18b75d305d99d04d2e42982ed5b787a081af2842220ed63287a2d6a10988')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/etc/security/pwquality.conf.d
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
