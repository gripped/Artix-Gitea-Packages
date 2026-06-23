# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.16.15
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
sha256sums=('5744222aaccbc484fd3c9486a514e41a8cf10f57ab4cf3a5861c892c3c687ed9')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
  --prefix=/usr \
  --disable-debug
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
