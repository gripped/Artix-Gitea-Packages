# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=libgig
pkgver=4.5.1
pkgrel=1
pkgdesc="C++ library for loading, modifying and creating .gig, .ksf, .kmp, .sf2 and DLS files"
arch=(x86_64)
url="https://www.linuxsampler.org/libgig/"
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(
  gcc-libs
  glibc
  util-linux-libs
)
makedepends=(
  libsndfile
  util-linux
)
provides=(libgig.so)
source=(
  https://download.linuxsampler.org/packages/$pkgname-$pkgver.tar.bz2
  $pkgname-4.3.0-libdir.patch
)
sha512sums=('65fca4398f77c864fc73b556333a9d3e81568bdc748bf01366626d4b5fbcd6ba82862962cd2e4af1407c9a61b74ded41773c38770469757a44b1938d209c9aca'
            '7bc339ff8fddc7e35ab8a58a591038bc06b8fb3acc895b471968e8731608e1524d74c3e58f6e5cff06ca1a4fd0c09de85e6ffedff0336df31270aeaf5aef6f81')
b2sums=('c35396aa55725b101a074e58506384ae071b1af2fd8005ea6b7bb19ad4b761b149135345308d8bccd08f49878078f94885d857cf8e32f1ca7c944900dda16be4'
        '67790271997b476b4fdd6eb82c69d889de3a2d0f419d5338fa552d8ebdaef37f12596307fc1831af3e2bae1e270e714f41358a71f518d912bed2200917957c74')

prepare() {
  # install libgig.so as a globally visible shared object
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-4.3.0-libdir.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(
    libsndfile libsndfile.so
  )
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,ChangeLog,NEWS,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
