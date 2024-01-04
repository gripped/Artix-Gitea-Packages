# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pacman-contrib
pkgver=1.10.1
pkgrel=1
pkgdesc='Contributed scripts and tools for pacman systems'
arch=('x86_64')
url=https://gitlab.archlinux.org/pacman/pacman-contrib
license=('GPL')
depends=('fakeroot' 'pacman' 'perl')
makedepends=('asciidoc' 'git')
optdepends=(
  'diffutils: for pacdiff'
  'findutils: for pacdiff --find'
  'mlocate: for pacdiff --locate'
  'sudo: privilege elevation for several scripts'
  'vim: default merge program for pacdiff'
)
source=("git+$url.git#tag=v$pkgver"
        'pacman-contrib-artix.patch')
b2sums=('SKIP'
        '7697cb9e94eba48792210f6c0b47917e5c3fb81dc9a28b21013781061ec4a327c8b302f3ce4722b9fba9b887e40b0e736285c537eaabb9cc0130df8cb9dfff36')
validpgpkeys=('04DC3FB1445FECA813C27EFAEA4F7B321A906AD9') # Daniel M. Capella <polyzen@archlinux.org>
#             '5134EF9EAF65F95B6BB1608E50FB9B273A9D0BB5')  # Johannes Löthberg <johannes@kyriasis.com>

prepare() {
  cd $pkgname
  patch -Np 1 -i ../pacman-contrib-artix.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
