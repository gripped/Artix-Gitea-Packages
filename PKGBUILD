# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=27.0
pkgrel=1
# https://github.com/erlang/otp/tags
_commit=601a012837ea0a5c8095bf24223132824177124d # OTP-27.0
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl wxwidgets-gtk3)
options=(staticlibs)
source=("https://github.com/erlang/otp/releases/download/OTP-$pkgver/otp_doc_man_$pkgver.tar.gz"
        "git+https://github.com/erlang/otp#commit=$_commit")
b2sums=('b55614bc3c795813eb2d73dc990f740efc8408a3639d98569adb9718ee140eb04ac2289ca3cd764d2610ac2138dfd6173b50bcae58b3971b51f4819cc33420e3'
        'c6c913b7b75feb2cec23404914bffbf016d8dbb9ec652874250e2aef930d75d62d6b1746beb7238a505e52f3aa98479d486825c41b9b4ac04437066d9e103a1f')

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
