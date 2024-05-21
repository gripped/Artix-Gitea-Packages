# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=minidlna-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for minidlna"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('minidlna' 'dinit')
conflicts=('init-minidlna')
provides=('init-minidlna')
source=("minidlnad")
sha256sums=('e758be7560a4b172704a436d0ae8211b59255190e2b1fca48b02c8c015f17698')

package() {
    install -Dm644 minidlnad "$pkgdir/etc/dinit.d/minidlnad"
}
