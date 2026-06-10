# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=archlinux-mirrorlist
pkgver=20260610
pkgrel=1
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL-2.0-or-later')
backup=(etc/pacman.d/mirrorlist-arch)
source=(mirrorlist)
b2sums=('c227e4ae1321e5f286bd8c305fe115ff9e1228e95fd484f196feda10b4a93d45dedc6654880bfa79aecfc448217b97e96082141cd5d02b7098866b373d358ae7')

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
  curl -o mirrorlist.checked 'https://archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on'
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
