# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=nilfs-utils
pkgver=2.2.13
pkgrel=1
pkgdesc="A log-structured file system supporting continuous snapshotting (userspace utils)"
arch=('x86_64')
url="http://nilfs.sourceforge.net/"
license=('GPL2' 'LGPL2.1')
backup=('etc/nilfs_cleanerd.conf')
depends=('util-linux')
source=(http://nilfs.sourceforge.net/download/$pkgname-$pkgver.tar.bz2)
sha256sums=('f0de7b2c2bc668033428c512886af916f92cabb1f517db2d24c139dda87d7b11')

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
