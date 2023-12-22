# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgbase=erlang
pkgname=(erlang erlang-unixodbc)
pkgver=26.2.1
pkgrel=1
_docver=26.1
# https://github.com/erlang/otp/tags
_commit=ca8b893f9d5bdd0957b78514ba523032e762c644 # OTP-26.2.1
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl unixodbc wxwidgets-gtk3)
options=(staticlibs)
source=("$url/download/otp_doc_man_$_docver.tar.gz"
        "git+https://github.com/erlang/otp#commit=$_commit")
b2sums=('2eed8963d425fe5ff3cd02eeacfd0eb86051225578613e374b71818a91e4f0b6953c4297a06ee59803d9421730c93871660ce66150a13d808f122a6f84f74f2a'
        'SKIP')

prepare() {
  # adjust how LDFLAGS are handled
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' otp/lib/{odbc/c_src,megaco/src/flex}/Makefile.in

  # let the Java bindings support version 11 or later, ref https://gitlab.archlinux.org/archlinux/packaging/packages/erlang/-/issues/1
  sed -i 's/^JAVA_OPTIONS =/JAVA_OPTIONS = --release 11/g' otp/lib/jinterface/java_src/com/ericsson/otp/erlang/Makefile
}

build() {
  export CFLAGS+=' -ffat-lto-objects'
  cd otp
  ./otp_build autoconf
  ./configure \
    --enable-threads \
    --enable-shared-zlib \
    --enable-ssl=dynamic-ssl-lib \
    --prefix=/usr \
    --with-odbc
  make DOC_TARGETS=chunks all
  make DOC_TARGETS=chunks docs
}

package_erlang() {
  pkgdesc='General-purpose concurrent functional programming language developed by Ericsson'
  depends=(glu ncurses openssl webkit2gtk wxwidgets-gtk3)
  optdepends=('erlang-unixodbc: database support'
              'java-environment: for Java support'
              'lksctp-tools: for SCTP support')
  provides=(erlang-nox)
  conflicts=(erlang-nox)

  export PATH="$srcdir/bin:$PATH"
  make -C otp DESTDIR="$pkgdir" DOC_TARGETS=chunks install install-docs

  # move files that belong to the erlang-unixodbc package
  mkdir -p unixodbc
  mv "$pkgdir/usr/lib/erlang/lib/odbc"* "$srcdir/unixodbc/"

  # readme and licenses
  install -Dm644 otp/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 otp/CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 otp/AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"

  # man pages
  cp -r -v man "$pkgdir/usr/lib/erlang/"
}

package_erlang-unixodbc() {
  pkgdesc='Unixodbc support for Erlang'
  depends=(erlang-nox unixodbc)

  install -d "$pkgdir/usr/lib/erlang/lib"
  mv unixodbc/* "$pkgdir/usr/lib/erlang/lib/"
  install -Dm644 otp/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE.txt"
}

# getver: raw.githubusercontent.com/erlang/otp/maint/OTP_VERSION
