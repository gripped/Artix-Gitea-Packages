# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.8
pkgrel=3
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
b2sums=('5745a412790eddb10ae674b0d4d15f2221cd4a59400f6eaeb7635d75e289df2a0a6eb4cdeaf3015aca27270c87bd776edaeb5e3cb9eeb88f892fbd2f48197a53')

build() {
  cd "$pkgname"
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
  ln -sfv "$pkgdir"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "$pkgdir"/usr/bin
}
