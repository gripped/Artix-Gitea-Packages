# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Mintsuki <mintsuki@protonmail.com>

pkgname=limine
_pkgname=Limine
pkgver=11.4.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
url="https://limine-bootloader.org/"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'nasm' 'mtools' 'llvm' 'lld' 'clang')
source=("git+https://github.com/Limine-Bootloader/Limine.git#tag=v${pkgver}?signed")
sha256sums=('11c3d8f6ad79a7fd6a111aa1eebd29fa8a840c9e4e58902cae6d0f4cea4c5ffc')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

prepare() {
	cd "${_pkgname}"
	./bootstrap
}

build() {
	cd "${_pkgname}"
	./configure --prefix=/usr --enable-all
	make
}

package() {
	cd "${_pkgname}"
  	make DESTDIR="${pkgdir}" install
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
