# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=bolt-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for bolt"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bolt' 'dinit')
conflicts=('init-bolt')
provides=('init-bolt')
source=("boltd")
sha256sums=('d5d12c6f8ad6fdfd2916fe97cd18108b42030f8fb6ba0ffea2f5bc3966cf540c')

package() {
    install -Dm644 boltd "$pkgdir/etc/dinit.d/boltd"
}
