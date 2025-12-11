# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_name=alsa-lib
pkgname=lib32-alsa-lib
pkgver=1.2.15
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (32 bit)"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL-2.1-or-later)
depends=(
  lib32-gcc-libs
  lib32-glibc
  alsa-lib=$pkgver
)
provides=(
  libasound.so
  libatopology.so
)
source=(
  https://www.alsa-project.org/files/pub/lib/$_name-$pkgver.tar.bz2{,.sig}
)
sha512sums=('6cea9059265ef353a07f1b442004506f0f13883692ea35f03090282ca80db88055f470d2dca5bb54394fef0012711f0e9502d2d0f7fb66b27aa334bffb811559'
            'SKIP')
b2sums=('ff5af357cd661df25e024150927e2f34a0e0d34cd1fff7b4af95489f3b2da2021db415bad98fbd33bd5ec862aa889a5bfbb05a216694776bf85eb8c95c66c7de'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --without-debug
    --disable-python
  )
  # -flto=auto is not supported: https://github.com/alsa-project/alsa-lib/issues/110
  CFLAGS+=" -flto-partition=none"

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
  make -k check -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  rm -r "$pkgdir"/usr/{bin,include,share}
}
