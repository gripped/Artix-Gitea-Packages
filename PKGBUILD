# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=nilfs-utils
pkgver=2.2.14
pkgrel=1
pkgdesc="A log-structured file system supporting continuous snapshotting (userspace utils)"
arch=('x86_64')
url="http://nilfs.sourceforge.net/"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
backup=('etc/nilfs_cleanerd.conf')
depends=('util-linux')
source=(http://nilfs.sourceforge.net/download/$pkgname-$pkgver.tar.bz2)
sha256sums=('2cd57a931ee1f560985660bc07f8d52ecf6bf743a3f653c45d60c7015d365b51')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  sed -i -e 's#root_sbindir=/sbin#root_sbindir=/usr/bin#' configure
  ./configure --sbindir=/usr/bin --with-libmount
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" sbindir=/usr/bin install LDCONFIG=/bin/true
}
