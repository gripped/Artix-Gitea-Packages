# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pacman-contrib
pkgver=1.11.0
pkgrel=1.1
pkgdesc='Contributed scripts and tools for pacman systems'
arch=(x86_64)
url=https://gitlab.archlinux.org/pacman/pacman-contrib
license=(GPL-2.0-or-later)
depends=(pacman)
makedepends=(
  asciidoc
  git
)
optdepends=(
  'diffutils: for pacdiff'
  'fakeroot: for checkupdates'
  'findutils: for pacdiff --find'
  'mlocate: for pacdiff --locate'
  'perl: for pacsearch'
  'sudo: privilege elevation for several scripts'
  'vim: default merge program for pacdiff'
)
source=("git+$url.git#tag=v$pkgver"
        pacman-contrib-artix.patch)
b2sums=('58b04aedd5536ec868ada5f133ac751592a7a9206431d23e8ad5144138433cc6c7291db35f52f702079712712bb6ba0f603ac9b761d2a1996b15a908dd2fff97'
        '22774e40aecc942e59420410b35f11c5bf41236c429545c8e62fe516619fa57b87d550b911b000fd287c360ecafe46b7bf0e70496eecebee59d94f31eb980523')
validpgpkeys=(04DC3FB1445FECA813C27EFAEA4F7B321A906AD9) # Daniel M. Capella <polyzen@archlinux.org>
#             5134EF9EAF65F95B6BB1608E50FB9B273A9D0BB5)  # Johannes Löthberg <johannes@kyriasis.com>

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
