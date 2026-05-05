# Maintainer: arc-d3v <arc-d3v@artixlinux.org>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=goverlay
pkgver=1.7.5
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
url="https://github.com/benjamimgois/goverlay"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glu' 'qt6pas' 'mangohud' '7zip' 'wget')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('mesa-utils: OpenGL preview'
  'vulkan-tools: Vulkan preview'
  'vkbasalt: Configure vkBasalt'
  'git: Clone reshade repository')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz")
sha256sums=('275d5e1646c2ed2c78520c8aeffd1dc6f0d9c5af52ae279caea665ac36b1c1b0')

build() {
  cd "${pkgname}-${_pkgver}"
  make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
  cd "${pkgname}-${_pkgver}"
  make tests
}

package() {
  cd "${pkgname}-${_pkgver}"
  make prefix=/usr libexecdir=/lib DESTDIR="${pkgdir}" install
}
