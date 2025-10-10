# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Byron Clark <byron@theclarkfamily.name>

# This package contains only thrift compiler and C/C++ libraries for all the
# language binding one should use corresponding language-specific package
# manager: CPAN for perl, gem for ruby, pip for python etc... Or better to
# create arch packages that install the binding from the language specific
# managers python2-thrift, perl-thrift, ruby-thrift, ...

pkgname=thrift
pkgver=0.22.0
pkgrel=1
pkgdesc="Scalable cross-language services framework for IPC/RPC"
arch=(x86_64)
url="https://thrift.apache.org"
_url="https://github.com/apache/thrift"
license=(Apache-2.0)
depends=(
  gcc-libs
  glib2
  glibc
  openssl
  zlib
)
makedepends=(
  boost
  emacs-nox
  git
  libevent
  qt5-base
)
optdepends=('qt5-base: TQTcpServer (Qt5) support')
provides=(
  "libthrift-$pkgver.so"
  "libthrift_c_glib.so"
  "libthriftnb-$pkgver.so"
  "libthriftqt5-$pkgver.so"
  "libthriftz-$pkgver.so"
)
source=(
  "git+$_url.git#tag=v$pkgver?signed"
  "$pkgname-THRIFT-5680-accept-failing-tests.patch"
  "$pkgname-remove-tests-with-compilation-error.patch"
)
sha512sums=('844c1c50d024c29fd76a5f3b7cf5f903656d5d80c95d621c7c52bb48653ca6c1bd5a861c04689cfd624b5e1fea36018ef3044fea1476f9f3aefe577cdb380643'
            '6651272168138690d3b33e4f97c1ef1e5063e88fd9f586c89cfd9f98eaff3320a0ca09f7bc462c3dc5d01f2da4f77b9154b3edf86cfbdec824d2d43bd60fe97d'
            'c0afceff4a03ebbda4c3d6ecf017fde19e1354c75772d2f992bc9253f05c06c145be2e1ff0d2f7ec87501954201231dbd057aaf56432ea86af08daf905475b84')
validpgpkeys=('8CD87F186F06E958EFCA963D76BD340FC4B75865') # Jens Geyer <jensg@apache.org>

prepare() {
  cd $pkgname
  # See https://issues.apache.org/jira/browse/THRIFT-5680
  patch -Np1 < ../$pkgname-THRIFT-5680-accept-failing-tests.patch
  patch -Np1 < ../$pkgname-remove-tests-with-compilation-error.patch

  ./bootstrap.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --without-java \
    --without-kotlin \
    --without-erlang \
    --without-nodejs \
    --without-nodets \
    --without-lua \
    --without-python \
    --without-py3 \
    --without-perl \
    --without-php \
    --without-php_extension \
    --without-dart \
    --without-ruby \
    --without-go \
    --without-swift \
    --without-rs \
    --without-cl \
    --without-haxe \
    --without-netstd \
    --without-d
  make
  emacs -Q --batch -f batch-byte-compile contrib/thrift.el
}

check() {
  cd $pkgname
  make -C lib/c_glib/test gen-c_glib/t_test_enum_test_types.h
  make -j1 check ||:
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" contrib/thrift.vim
  install -vDm644 -t "$pkgdir/usr/share/emacs/site-lisp" \
    contrib/thrift.el \
    contrib/thrift.elc
}
