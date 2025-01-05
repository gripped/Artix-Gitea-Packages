# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: nous  <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-keyring
pkgver=20250105
pkgrel=1
pkgdesc='Artix PGP keyring'
arch=('any')
url='https://gitea.artixlinux.org/artix/artix-keyring'
sigurl="${url}/raw/branch/master/artix-keyring-${pkgver}.tar.gz.signature"
license=('GPL')
depends=('pacman')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${sigurl}")
sha256sums=('607b89cb2fcff3dcad1abc2f1f2bf1a7619e3f14dd275f1c86569b298cd1f019'
            'bc2fc04735ce5b2a6f627775e043383fde95a4a3c45d4e1d1757665f1d1f8a27')
validpgpkeys=('80E461C30BE40AD3EFB57E18EA690BC73A4F1094') # nous

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
