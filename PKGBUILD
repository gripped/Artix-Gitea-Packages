# Original Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Current Maintainer: MidnightMH <mhbagheri12 (at) Gmail (dot) com> [2025--present]

pkgname=b43-firmware
_classic_=${pkgname}-classic
pkgver=6.30.163.46
pkgrel=1
pkgdesc="Firmware for Broadcom B43 wireless networking chips - latest release"
arch=("any")
url="https://wireless.wiki.kernel.org/en/users/Drivers/b43"
license=("unknown")
depends=("linux>=3.2")
makedepends=("b43-fwcutter>=018")
conflicts=(${_classic_})
install=${pkgname}.install
options=(!emptydirs)
source=(https://github.com/minios-linux/b43-firmware/releases/download/b43-firmware/broadcom-wl-6.30.163.46.tar.bz2)

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/usr/lib/firmware/

	# Application
	b43-fwcutter -w "${pkgdir}"/usr/lib/firmware/ broadcom-wl-${pkgver}.wl_apsta.o

	# Messages
	#msg "You should add 'b43' to the 'MODULES' array of your '/etc/rc.conf' file."
}

sha256sums=('a07c3b6b277833c7dbe61daa511f908cd66c5e2763eb7a0859abc36cd9335c2d')

