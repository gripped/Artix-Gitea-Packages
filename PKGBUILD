# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: artist for Artix Linux

pkgname=mint-themes-legacy
_pkgname=mint-l-theme
pkgver=2.0.2
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="https://github.com/linuxmint/${_pkgname}"
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
source=("${pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a575a8dce6b6346cccabfc7bdd2049f0ead9339844802e1e06480da8196a2c3c')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  cp -r usr $pkgdir
}
