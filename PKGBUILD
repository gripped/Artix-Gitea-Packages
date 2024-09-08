# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=archlinux-mirrorlist
pkgver=20240717
pkgrel=1.1
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL')
backup=(etc/pacman.d/mirrorlist-arch)
source=(mirrorlist)
md5sums=('0f5939ffc11cd22f2fe55268ecea5fcf')
sha256sums=('b5d31c02839282441d72bf045013fcfb5379ede2d7844184bd0e6a6578756ca8')

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
