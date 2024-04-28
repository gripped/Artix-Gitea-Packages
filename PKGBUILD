# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: nous  <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-keyring
pkgver=20240425
pkgrel=2
pkgdesc='Artix PGP keyring'
arch=('any')
url='https://gitea.artixlinux.org/artix/artix-keyring'
sigurl="${url}/raw/branch/master/artix-keyring-${pkgver}.tar.gz.signature"
license=('GPL')
depends=('pacman')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${sigurl}")
sha256sums=('4eaedb9d0766600851810c62f3cb7a5df166f9e0ffd54e7ba72bf0bdd2a7f8a5'
            '9ac171192c6a14be494d5c1ffab892cdb474faa468cbd9437fa89f6c4ebab95a')
validpgpkeys=('80E461C30BE40AD3EFB57E18EA690BC73A4F1094') # nous

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
