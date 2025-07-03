# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=archlinux-mirrorlist
pkgver=20250702
pkgrel=2
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL-2.0-or-later')
backup=(etc/pacman.d/mirrorlist-arch)
source=(mirrorlist)
b2sums=('7abdc47b81dd6b05be147ae9474bd031b8628afc4e05fb81987b76fb8763d6c7beb66d2a8e5bef0f91a6174c7eb74690a84f3b66705db2d8f81e2d6a01ae3cc8')

# NOTE on building this package:
# * Run bash -c ". PKGBUILD; updatelist"
# * Update the checksums, update pkgver
# * Build the package

updatelist() {
  # cleanup first
  rm -f mirrorlist
  # get a full list (sorted)
  curl -o mirrorlist.all 'https://archlinux.org/mirrorlist/?country=all'
  # get a list of working mirrors (unsorted)
  curl -o mirrorlist.checked 'https://archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on'
  # write new sorted list
  while IFS= read -r line; do
      grep -q "$line" mirrorlist.checked && echo "$line" >> mirrorlist
  done < mirrorlist.all
  # cleanup
  rm -f mirrorlist.{all,checked}
}

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m0644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/mirrorlist-arch"
}
