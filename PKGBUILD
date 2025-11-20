# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=gnu-efi
pkgver=4.0.2
pkgrel=1
pkgdesc="Develop EFI applications using the GNU toolchain and the EFI development environment"
arch=(x86_64)
url="https://github.com/ncroxon/gnu-efi"
license=(
  BSD-2-Clause
  BSD-2-Clause-Patent
  BSD-3-Clause
  'BSD-2-Clause OR GPL-2.0-or-later'
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
conflicts=(gnu-efi-libs)
provides=(gnu-efi-libs)
replaces=(gnu-efi-libs)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
options=(!lto !strip)
sha512sums=('a52e21daad16af6c1d9cff7f04076584251b77fe1eddc4e720d19de5d0a8d7cca5994b770d3236bcd9b2431918b427dd362ca7cb7e2a6e893ca4ba0e0ead9395')
b2sums=('4fe4a1000b2bcdb779aaa82e80f2a722a70230ac82f40e8fd4bfe67f73135e58e44a58b7cafce33702847ed00a1161fbc9565037298129f642ef1d875b04086c')

prepare() {
  # -Werror, not even once
  sed -e 's/-Werror//g' -i $pkgname-$pkgver/Make.defaults
}

build() {
  cd $pkgname-$pkgver
  # NOTE: apply only minimal CFLAGS, as gnu-efi does not provide userspace
  # libs, but may be used in unitialized machine state and should therefore not
  # be architecture optmized
  CFLAGS="-O2"
  # upstream provides LDFLAGS directly to ld: https://sourceforge.net/p/gnu-efi/bugs/33/
  LDFLAGS="${LDFLAGS//-Wl/}"
  LDFLAGS="${LDFLAGS//,/ }"
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make INSTALLROOT="$pkgdir" PREFIX=/usr install
  install -vDm 644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {README,SECURITY}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
