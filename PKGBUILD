# Maintainer: Dudemanguy <dudemanguy@artixlinux.org

pkgname=artix-checkupdates
pkgver=0.10.8
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
b2sums=('fafbf919c982762f56e94b1f7930c44a7524627795c3ee4a7753c4fad8594cfac85b64fc8a591577578f4404af02d9fb9e44f63c2ff85234f610f3c9e0c7aac1')

build() {
  cd "$pkgname" || exit
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
  ln -sfv "$pkgdir"/usr/bin/artix-checkupdates comparepkg
  install -D comparepkg -t "$pkgdir"/usr/bin
}
