# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.4
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
b2sums=('7947a3d6566a26fd7ae75e462601fa302cf05c1de43ee36efd2f80d8257775c4bdd428a9eac3ad5f9b978e4db27728daffa6e1c523fd427c9c8262c991451f33')

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
  ln -sfv "${pkgdir}"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "${pkgdir}"/usr/bin
}
