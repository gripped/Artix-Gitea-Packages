# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: xduugu

pkgname=patchelf
pkgver=0.19.0
pkgrel=1
pkgdesc='Small utility to modify the dynamic linker and RPATH of ELF executables'
url='https://nixos.org/patchelf.html'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('gcc-libs')
source=(git+https://github.com/NixOS/patchelf.git#tag=${pkgver})
sha512sums=('d2c0741ead24ba0740d9d9eaae11795471409bc54b22ac2ff16770029acd0b37d96ea33a9c551219940831f6649cf729b582d68fa95b82d2733dc62d47237099')
b2sums=('9aa5af03a417f832e45a745365517dc734d96ec6cf633f5807363ae40647412eadf4a4e74526d384487bd9b660f9622a4a94d8c1df9419a6941d7a59ee5a05e1')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}
  make -C tests -j1 check
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
