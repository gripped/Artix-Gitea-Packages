# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dropbear-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for dropbear"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dropbear' 'dinit')
conflicts=('init-dropbear')
provides=('init-dropbear')
source=("dropbear")
sha256sums=('7f4ff2c1a94143b513ffd7bde539a6ffeadfc974c6d75a23ec858bffbdcf5fbd')

package() {
    install -Dm644 dropbear "$pkgdir/etc/dinit.d/dropbear"
}
