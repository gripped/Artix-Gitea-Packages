# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib
pkgver=1.2.15
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL-2.1-or-later)
depends=(
  alsa-topology-conf
  alsa-ucm-conf
  glibc
)
provides=(
  libasound.so
  libatopology.so
)
install=$pkgname.install
source=(
  $url/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig}
)
sha512sums=('6cea9059265ef353a07f1b442004506f0f13883692ea35f03090282ca80db88055f470d2dca5bb54394fef0012711f0e9502d2d0f7fb66b27aa334bffb811559'
            'SKIP')
b2sums=('ff5af357cd661df25e024150927e2f34a0e0d34cd1fff7b4af95489f3b2da2021db415bad98fbd33bd5ec862aa889a5bfbb05a216694776bf85eb8c95c66c7de'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  # -flto=auto is not supported: https://github.com/alsa-project/alsa-lib/issues/110
  CFLAGS+=" -flto-partition=none"
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --without-debug
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  export LD_LIBRARY_PATH="$pkgname-$pkgver/src/.libs/:$LD_LIBRARY_PATH"
  make -k check -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}
