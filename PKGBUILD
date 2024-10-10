# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=27.1.1
_docver=27.0
pkgrel=1
# https://github.com/erlang/otp/tags
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl unixodbc wxwidgets-gtk3)
options=(staticlibs)
source=("git+https://github.com/erlang/otp#tag=OTP-$pkgver")
b2sums=('b3249eae170d3e35a0e099eba7aba69d4b504e329fac112429e1975d3970d0018adf8cdceb16661020286e674b3196d80c7ae1051076666a8ab634db0b50a80f')

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
    --prefix=/usr \
    --with-odbc

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



  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" otp/{AUTHORS,CONTRIBUTING.md,README.md}
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
