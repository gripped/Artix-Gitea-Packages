# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=b43legacy-firmware
pkgver=3.130.20.0
pkgrel=1
pkgdesc="Firmware for Broadcom B43 wireless networking chips using the b43legacy driver"
arch=("any")
url="https://wireless.wiki.kernel.org/en/users/Drivers/b43"
license=("unknown")
depends=("linux>=3.2")
makedepends=("b43-fwcutter>=018")
options=(!emptydirs)
source=("http://downloads.openwrt.org/sources/wl_apsta-${pkgver}.o")

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/lib/firmware/
  b43-fwcutter -w "${pkgdir}"/usr/lib/firmware/ wl_apsta-${pkgver}.o
}

sha256sums=('7dba610b1d96dd14e901bcbce14cd6ecd1b1ac6f5c0035b0d6b6dc46a7c3ef90')

