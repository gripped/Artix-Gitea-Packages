# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=27.2.1
_docver=27.0
pkgrel=1
arch=(x86_64)
url='https://erlang.org/'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl unixodbc wxwidgets-gtk3)
options=(staticlibs)
# https://github.com/erlang/otp/tags
source=("git+https://github.com/erlang/otp#tag=OTP-$pkgver"
        "https://github.com/erlang/otp/releases/download/OTP-$_docver/otp_doc_man_$_docver.tar.gz"
        epmd.conf)
b2sums=('cd4adfc17a9253b988a3add4017c384c8c2474b24711ef67e120aea130652fe6a00c7ba55dc580a6d47c5199f6170a3ba72392e98d1a8dad5d7197789ac01106'
        'b55614bc3c795813eb2d73dc990f740efc8408a3639d98569adb9718ee140eb04ac2289ca3cd764d2610ac2138dfd6173b50bcae58b3971b51f4819cc33420e3'
        '1675ac9bf948ab19e8b63077d870ccf356fcdbce14de2777f00b3488aa1ce34a5e0a5cdc0428707f744dee5940b12653a44e0ded0554de95ebb31bce4676ff87')

prepare() {
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' otp/lib/megaco/src/flex/Makefile.in
  # Let the Java bindings support version 11 or later, ref https://gitlab.archlinux.org/archlinux/packaging/packages/erlang/-/issues/1
  sed -i 's/^JAVA_OPTIONS =/JAVA_OPTIONS = --release 11/g' otp/lib/jinterface/java_src/com/ericsson/otp/erlang/Makefile
}

build() {
  cd otp

  export CFLAGS+=' -ffat-lto-objects'

  ./otp_build autoconf
  ./configure \
    --enable-threads \
    --enable-shared-zlib \
    --enable-ssl=dynamic-ssl-lib \
    --prefix=/usr

  DOC_TARGETS=chunks make all
  DOC_TARGETS=chunks make docs
}

package_erlang() {
  pkgdesc='General-purpose concurrent functional programming language developed by Ericsson'
  depends=(glu ncurses openssl unixodbc webkit2gtk wxwidgets-gtk3)
  optdepends=('java-environment: for Java support'
              'lksctp-tools: for SCTP support')
  provides=(erlang-nox)
  conflicts=(erlang-nox)

  export PATH="$srcdir/bin:$PATH"
  make -C otp DESTDIR="$pkgdir" DOC_TARGETS=chunks install install-docs

  install -Dm644 epmd.conf "$pkgdir/etc/conf.d/epmd"

  cp -r man "$pkgdir/usr/lib/erlang/"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" otp/{AUTHORS,CONTRIBUTING.md,README.md}
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
