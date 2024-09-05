# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.2
pkgrel=1
pkgdesc="Tool to check on updates between Artix and Arch"
arch=(x86_64)
url="https://gitea.artixlinux.org/artix/artix-checkupdates"
license=('GPL-3.0-only')
groups=('artix-tools')
depends=(
    'brotli'
    'curl'
    'acl'
    'openssl'
    'glibc'
    'libunistring'
    'keyutils'
    'pacman' 'libalpm.so'
)
makedepends=('git')
backup=('etc/artix-checkupdates/config')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('8e8e8c92046e477dbf41191fd5aae9163ac53715a6726aedeaebe5fc7c4426ab1f9c1823cbbb5abc7906bb7547c2f6c98b07e71eb4bb0bc913ef5a45a7b971a6')

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
  ln -sfv "${pkgdir}"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "${pkgdir}"/usr/bin
}
