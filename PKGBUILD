# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=gettext
pkgver=0.26
pkgrel=1.1
pkgdesc="GNU internationalization library"
url="https://www.gnu.org/software/gettext/"
arch=(x86_64)
license=(
  GFDL-1.2-only
  GPL-2.0-only
  GPL-2.0-or-later
  LGPL-2.0-only
)
depends=(
  acl
  attr
  gcc-libs
  gnulib-l10n
  libunistring
  libxml2
  ncurses
  sh
)
makedepends=(
  emacs
)
optdepends=('git: for autopoint infrastructure updates'
            'appstream: for appstream support')
options=(!docs)
source=(
  https://ftp.gnu.org/pub/gnu/gettext/$pkgname-$pkgver.tar.gz{,.sig}
  autopoint.patch
)
b2sums=('f8e6b6d232b0a92f333d934c273a6923af40a9d6c632e20d240c7260d13f4be4bacd89efe4ccc2cce5a847e45e87911d692ef6c6f749c1821d1d5508daa14188'
        'SKIP'
        'f18bc3e5e5ae42ab32d391edf2baa6bba9fd33d3fdcdf44b01ea36f4f7346b1baaf6f5da01439d850f855dd93f07441a9813351edcc31bc89db58a379a42926f')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D'  # Bruno Haible
              'E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Open Source Development)

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-csharp \
    --enable-nls \
    --with-xz \
    --without-included-gettext \
    --without-included-libunistring
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i gettext-{tools,runtime,runtime/libasprintf}/libtool
  patch -Np1 -i $srcdir/autopoint.patch
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
