# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=snowball
pkgname=(
  snowball
  libstemmer
)
pkgver=2.2.0
pkgrel=3
pkgdesc="String processing language for creating stemming algorithms"
url="https://snowballstem.org/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git)
source=(
  "git+https://github.com/snowballstem/snowball#tag=v$pkgver"
  0001-Make-libstemmer-a-shared-library.patch
)
b2sums=('410b9b9485f75f0cef29af1bde55d909f52678280ae22dda27bee0df1eb1eeb1e995a15fc544d993eb9b90ab929443646e14984d6dbeb35e88ce0a17be3830b6'
        '64543774530c852a6d20ddca425865e1aa458adf9f2b3fa2e55ef37f50128c01e01ead7b96978d2c4ba2340f557824275ca27780142ee99425d623678e355c67')

prepare() {
  cd snowball
  git apply -3 ../0001-Make-libstemmer-a-shared-library.patch
}

build() {
  cd snowball
  make
}

# No check - needs external test data

package_snowball() {
  depends+=(libstemmer)

  cd snowball

  install -D snowball stemwords -t "$pkgdir/usr/bin"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libstemmer() {
  pkgdesc="Stemming library supporting several languages"
  provides=(libstemmer.so)

  cd snowball

  install -Dm644 include/libstemmer.h -t "$pkgdir/usr/include"

  install -Dm644 libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so.0.0.0"
  ln -s libstemmer.so.0.0.0 "$pkgdir/usr/lib/libstemmer.so.0"
  ln -s libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
