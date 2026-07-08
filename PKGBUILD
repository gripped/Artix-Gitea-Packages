# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Jason Hall <cakersq@gmail.com>

pkgname=thin-provisioning-tools
pkgver=1.3.3
pkgrel=1
pkgdesc='Suite of tools for manipulating the metadata of the dm-thin device-mapper target'
arch=('x86_64')
url='https://github.com/jthornber/thin-provisioning-tools'
license=('GPL-3.0-or-later')
depends=('glibc'
         'libgcc' 'libgcc_s.so'
         'libudev.so')
makedepends=('git' 'cargo' 'clang' 'device-mapper')
source=("git+https://github.com/jthornber/thin-provisioning-tools#tag=v${pkgver}")
sha256sums=('fdd73436d4f70165cdc3753d1082d630845a7a1dbd773a73ac99595b97a5aa93')

build() {
  cd "${srcdir}/${pkgname}"

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"

  make \
    DESTDIR="${pkgdir}"/usr \
    BINDIR="${pkgdir}"/usr/bin \
    DATADIR="${pkgdir}"/usr/share \
    install
}

