# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=archlinux-mirrorlist
pkgver=20250311
pkgrel=1
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL-2.0-or-later')
backup=(etc/pacman.d/mirrorlist-arch)
source=(mirrorlist)
b2sums=('9b7f50f74caa93ab8ea1a6fb86218c42cdd57c6b5a8f33506e71c3728cfd5a6516da242edbec878f98c0c2dc69e5e9e24c636ea33dbfd7ed85593dea161e5167')

# NOTE on building this package:
# * Run bash -c ". PKGBUILD; updatelist"
# * Update the checksums, update pkgver
# * Build the package

updatelist() {
  rm -f mirrorlist
  curl -o mirrorlist https://archlinux.org/mirrorlist/all/
}

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m0644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/mirrorlist-arch"
}
