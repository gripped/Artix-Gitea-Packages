# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=lmdbxx
pkgver=1.0.2
pkgrel=1
pkgdesc="C++17 wrapper for the LMDB embedded B+ tree database library"
arch=('x86_64')
url="https://github.com/hoytech/lmdbxx"
license=('Unlicense')
depends=(lmdb)
source=("https://github.com/hoytech/lmdbxx/archive/$pkgver/lmdbxx-$pkgver.tar.gz")
sha512sums=('2e30dd439729f2947649be7ef3aa10e07a0feb073000128ece2948b857bf43debc84d7093472180798b62994d70810c7a4febd3f85ae9efda2483e55207df4a2')
b2sums=('e9a7599398de6995c1af9e09df7ac2f031fbfba93f0d71842f0a598412fd7291a0030aeb8e2e1a45b4d2dffc166fb146f2136b7904da5335089135e03ae3ac5c')

check() {
  cd "${pkgname}-${pkgver}"
  make CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS" check
}

package() {
  # Blocked from https://bugs.archlinux.org/task/77537
  # depends+=(
  #   lmdb liblmdb.so
  # )

  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -vDm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ft=sh sw=2 sts=2 et:
