# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=matrix-synapse-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for matrix-synapse"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('matrix-synapse' 'dinit')
conflicts=('init-matrix-synapse')
provides=('init-matrix-synapse')
source=("matrix-synapse")
sha256sums=('540a3103c81b22ec5b47da527042665ac383315253b715de00f97dc87ce5863b')

package() {
    install -Dm644 matrix-synapse "$pkgdir/etc/dinit.d/matrix-synapse"
}
