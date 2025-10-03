# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=archlinux-mirrorlist
pkgver=20251003
pkgrel=1
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL-2.0-or-later')
backup=(etc/pacman.d/mirrorlist-arch)
source=(mirrorlist)
b2sums=('3fe5c5572fc854e2ab534164698a8d8de5a386f46d20e8633a01c6489b6506cb7de73454de312b480aacda75d050636f514fdc7ef90a58d63c6d06e78fd4fbb9')

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
