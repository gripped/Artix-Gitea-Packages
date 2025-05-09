# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_05_07.eea8a76
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
sha512sums=('29568a77f1c178f1697cb50244fb9ea0be107808301e55204114338853988254089e0f0eac53097fd9f129fc075df20b2640b0122bcdc13dab08feea4b078f86')
b2sums=('3015ca85a564a48f92d866ce4589f2ff12f7b3d2ec5e394b3ce036e486369f885587ea048c44772ea15f273be94a3448ab071ac13598e5aaa29beeec9437aa47')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
