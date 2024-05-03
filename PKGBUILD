# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=26.2.5
pkgrel=1
_docver=26.1
# https://github.com/erlang/otp/tags
_commit=412bff5196fc0ab88a61fe37ca30e5226fc7872d # OTP-26.2.5
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl wxwidgets-gtk3)
options=(staticlibs)
source=("$url/download/otp_doc_man_$_docver.tar.gz"
        "git+https://github.com/erlang/otp#commit=$_commit")
b2sums=('2eed8963d425fe5ff3cd02eeacfd0eb86051225578613e374b71818a91e4f0b6953c4297a06ee59803d9421730c93871660ce66150a13d808f122a6f84f74f2a'
        'e1ea412389c94d53f749a8d9b7095a191b85b0be930ed5c9b94aaf69cc7d3a62694ada4ea1a502136840777c28f438bd8e717a1e556fa6336140696bf9179716')

prepare() {
  # adjust how LDFLAGS are handled
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' otp/lib/megaco/src/flex/Makefile.in

  # let the Java bindings support version 11 or later, ref https://gitlab.archlinux.org/archlinux/packaging/packages/erlang/-/issues/1
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

  # readme and licenses
  install -Dm644 otp/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 otp/CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 otp/AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"

  # man pages
  cp -r -v man "$pkgdir/usr/lib/erlang/"
}
