# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.5
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
b2sums=('d1ae246b26043ce055fdb74513f36c01f264fcb12dc5a340ee3e7259ca8197ef2fe8e55d52e19639c5af8381876dfa2246fa80824570383f35bf8353e51096e0')

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
  ln -sfv "${pkgdir}"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "${pkgdir}"/usr/bin
}
