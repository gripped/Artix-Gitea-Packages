# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang
pkgver=27.2.1
pkgrel=2
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson'
arch=(x86_64)
url='https://erlang.org/'
license=(Apache-2.0)
depends=(
  gcc-libs
  glib2
  glibc
  glu
  libglvnd
  ncurses
  openssl
  unixodbc
  webkit2gtk-4.1
  wxwidgets-common
  wxwidgets-gtk3
  zlib
)
makedepends=(
  fop
  git
  java-environment
  libxslt
  lksctp-tools
  mesa
  perl
)
optdepends=(
  'java-environment: for Java support'
  'lksctp-tools: for SCTP support'
)
provides=(erlang-nox)
conflicts=(erlang-nox)
options=(staticlibs)
source=(
  "git+https://github.com/erlang/otp#tag=OTP-$pkgver"
  epmd.conf
)
b2sums=('cd4adfc17a9253b988a3add4017c384c8c2474b24711ef67e120aea130652fe6a00c7ba55dc580a6d47c5199f6170a3ba72392e98d1a8dad5d7197789ac01106'
        '1675ac9bf948ab19e8b63077d870ccf356fcdbce14de2777f00b3488aa1ce34a5e0a5cdc0428707f744dee5940b12653a44e0ded0554de95ebb31bce4676ff87')

prepare() {
  cd otp
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' \
    lib/megaco/src/flex/Makefile.in \
    lib/odbc/c_src/Makefile.in
  # Let the Java bindings support version 11 or later, ref:
  # https://gitlab.archlinux.org/archlinux/packaging/packages/erlang/-/issues/1
  sed -i 's/^JAVA_OPTIONS =/JAVA_OPTIONS = --release 11/g' \
    lib/jinterface/java_src/com/ericsson/otp/erlang/Makefile
}

build() {
  cd otp
  export CFLAGS+=' -ffat-lto-objects'
  ./configure \
    --enable-threads \
    --enable-shared-zlib \
    --enable-ssl=dynamic-ssl-lib \
    --with-ssl-rpath=/usr/lib \
    --prefix=/usr

  make all
  make DOC_TARGETS="chunks man" docs
}

package() {
  install -vDm644 epmd.conf "$pkgdir/etc/conf.d/epmd"

  cd otp
  make DESTDIR="$pkgdir" install install-docs \
    DOC_TARGETS="chunks man" \
    RELSYS_MANDIR="$pkgdir/usr/share/man"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    AUTHORS CONTRIBUTING.md README.md

  rm -v "$pkgdir/usr/lib/erlang/Install" "$pkgdir/usr/share/man/man1/.gitignore"
}
