# Maintainer: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=metalog
pkgver=20220214
pkgrel=1
pkgdesc="A modern replacement for syslogd and klogd"
url="http://metalog.sourceforge.net"
license=('GPL')
arch=('x86_64')
makedepends=('autoconf-archive')
depends=('pcre')
provides=('logger')
backup=('etc/metalog.conf')
source=("https://github.com/hvisage/metalog/archive/metalog-${pkgver}.tar.gz")
sha256sums=('3a9dd6f1460d90296771c81aa71fc0f45dd25ef22af63f48e6cbe5422a88f3bf')

build() {
  cd $pkgname-$pkgname-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbin=/usr/bin
  make
}

package() {
  cd $pkgname-$pkgname-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D -m644 metalog.conf "$pkgdir/etc/metalog.conf"
}
