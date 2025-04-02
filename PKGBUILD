# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.7
pkgrel=1.1
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
b2sums=('8cd7ea222d4e79dcec77201c7f84ab581e4ec8bd68b50ae6a44c405aa72ea1f815968541614f1120b0a031ec442103b9a455ba216cda4203f6f394b771ec80b3')

build() {
  cd "$pkgname" || exit
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
  ln -sfv "$pkgdir"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "$pkgdir"/usr/bin
}
