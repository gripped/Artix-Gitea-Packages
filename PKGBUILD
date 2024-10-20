# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.3
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
b2sums=('07420d43805ed956cb4acff40907d136b8a2c4b20ee9ddd0d4e04a3c889fca85656b9f0a1926992074d7328f7c80ce192e46d84c3d1a91a776234fcc4007f8de')

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
  ln -sfv "${pkgdir}"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "${pkgdir}"/usr/bin
}
