# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: librewish <librewish at gmail dot com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Garcia <morbidj at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Orzanna <orschiro at gmail dot com>

pkgname=timeshift
pkgver=26.11.1
pkgrel=1.1
pkgdesc="A system restore utility for Linux"
url="https://github.com/linuxmint/timeshift"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libgee' 'json-glib' 'gtk3' 'vte3' 'rsync' 'xapp' 'cronie')
makedepends=('help2man' 'meson' 'vala')
optdepends=('btrfs-progs: For BTRFS support'
            'grub-btrfs: For BTRFS snapshots in GRUB')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8e6ec74c88b205fbbbb53f46ac7c3aa3203089aabb398deb5d177b32a7a494e2')

build() {
	artix-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
