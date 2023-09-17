# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgbase=erlang
pkgname=(erlang erlang-unixodbc)
pkgver=26.0.2
pkgrel=2
_docver=26.0
arch=(x86_64)
url='https://erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools mesa perl unixodbc wxwidgets-gtk3)
options=(staticlibs)
source=(
        "$url/download/otp_doc_man_$_docver.tar.gz"
        "git+https://github.com/erlang/otp#commit=d051172925a5c84b2f21850a188a533f885f201c") # tag: OTP-26.0.2
b2sums=(
        '428b88d6b9c9bc80d2b8cd85a4d86ffb9dbe6eb68c1acb3e841a2fd85dff1ee9f0c20217766f64b74f454ae72f1c146d5df511b3662d399079bc2400cf8c9a26'
        'SKIP')

prepare() {
  # adjust how LDFLAGS are handled
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' otp/lib/{odbc/c_src,megaco/src/flex}/Makefile.in
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
