# Maintainer: Chris Cromer <cromer@artixlinux.org>

pkgname=mint-themes
pkgver=2.2.3
pkgrel=1
pkgdesc='A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    ttf-ubuntu-font-family
)
makedepends=(
    gtk3
    inkscape
    optipng
    python
    sassc
)
optdepends=(
    mint-y-icons
    mint-x-icons
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('9751ccd489c16497e5d5c067b582c0106193045a04b8368fcbfee08655c06b5b')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}
