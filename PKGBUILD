# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=27.0.1
_docver=27.0
pkgrel=1
# https://github.com/erlang/otp/tags
_commit=ee9628e7ed09ef02e767994a6da5b7a225316aaa # OTP-27.0.1
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl wxwidgets-gtk3)
options=(staticlibs)
source=("git+https://github.com/erlang/otp#commit=$_commit")
b2sums=('99300d27abe6fc6a5c1ace5315569b4abf17913488aafa7937fcc57138cc44cf7d0e28f6590b0e97c4018d55aa00aae84295aa4f1161ef036f47b6edb5113510')

prepare() {
  # Adjust how LDFLAGS are handled
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
    --without-odbc

  DOC_TARGETS=chunks make all
  DOC_TARGETS=chunks make docs
}

package_erlang() {
  pkgdesc='General-purpose concurrent functional programming language developed by Ericsson'
  depends=(glu ncurses openssl webkit2gtk wxwidgets-gtk3)
  optdepends=('java-environment: for Java support'
              'lksctp-tools: for SCTP support')
  provides=(erlang-nox)
  conflicts=(erlang-nox)

  export PATH="$srcdir/bin:$PATH"
  make -C otp DESTDIR="$pkgdir" DOC_TARGETS=chunks install install-docs



  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" otp/{AUTHORS,CONTRIBUTING.md,README.md}
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
