# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Nezmer <Nezmer@gmail.com>

pkgname=fribidi
pkgver=1.0.14
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glibc
)
makedepends=(
  meson
)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/fribidi-$pkgver.tar.xz")
b2sums=('dafe1c46b5b6ee8fb67850ceb98b9832663421b7b305d9f1bb042a920faf0641046eb9b82f8d4af0cab7644b666202a1dfbbe0d8a9e2af78f824b167c7e2c219')

prepare() {
  cd fribidi-$pkgver
}

build() {
  local meson_options=(
  )

  artix-meson fribidi-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

