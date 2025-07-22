# Maintainer: Chris Cromer <cromer@artixlinux.org>

pkgname=mint-y-icons
pkgver=1.8.4
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    gtk-update-icon-cache
    hicolor-icon-theme
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('e06892771c1866f4e4deee40e4f27dc616cb428cd7980b54fd28d8a512246840')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
