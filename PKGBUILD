# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_12_09.c3f1ba7
pkgrel=1
pkgdesc="Plug A Simple Socket Transport"
arch=(x86_64)
url="https://passt.top/passt/about/"
license=(
  BSD-3-Clause
  GPL-2.0-or-later
)
depends=(glibc)
optdepends=(
  'sh: for demo script'
)
source=(https://passt.top/$pkgname/snapshot/$pkgname-$pkgver.tar.zst)
sha512sums=('d7f0da708cf36d9577a901a9aa7270641aa724d3a51c49cb048d4586703bb7f6e837318a9908a4f6cbc751f070a8f6567c82c099a5c4b4557e50bbd0c5ebe697')
b2sums=('26fab2524e8c1e80fe12d0d00b7a6101d4e224f607dbba34e72645082c99983081a51693bce785e62084246ab5764bffc0e68a4cfbf7f2b7507f7b19bf21897b')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
