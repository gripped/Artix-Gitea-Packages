# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.6
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
b2sums=('ddfbbbf14bdcdfea3868aced9d4313f8928ee62cd8c13c317e9bef6bc11593e487eaf1b1105987832bb1ccade1b31544a03aba9f0085e084626b111ae0a0f758')

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
  ln -sfv "${pkgdir}"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "${pkgdir}"/usr/bin
}
