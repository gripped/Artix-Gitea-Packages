# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=matrix-synapse-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for matrix-synapse"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('matrix-synapse' 'dinit')
conflicts=('init-matrix-synapse')
provides=('init-matrix-synapse')
source=("matrix-synapse")
sha256sums=('f57f85d339d71989aff996125d01b13469329db681673f01c7e19234307a1762')

package() {
    install -Dm644 matrix-synapse "$pkgdir/etc/dinit.d/matrix-synapse"
}
