# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Maintainer: nous  <nous.org>
# Maintainer: artoo <artoo.org>

pkgname=artix-keyring
pkgver=20240319
pkgrel=1
pkgdesc='Artix PGP keyring'
arch=('any')
url='https://gitea.artixlinux.org/nous/artix-keyring'
sigurl="${url}/raw/branch/master/artix-keyring-20240319.tar.gz.signature"
license=('GPL')
depends=('pacman')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::${sigurl}")
sha256sums=('25c40ccb405abf9b9594bfc659276c6188c3d51743f6095bc31fb8c3fa56d6ee'
            '21cf9a8412a88f6ecec1743e35ac20824e431139297265791feb86ed7d800311')
validpgpkeys=('80E461C30BE40AD3EFB57E18EA690BC73A4F1094') # nous

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
