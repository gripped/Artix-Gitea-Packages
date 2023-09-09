# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=boinc-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for boinc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('boinc' 'dinit')
conflicts=('init-boinc')
provides=('init-boinc')
source=("boinc")
sha256sums=('c946f7df4c930b26dbf1690ea10dd67d4f3b7ad3c8ff33b9cffd026a6621362d')

package() {
    install -Dm644 boinc "$pkgdir/etc/dinit.d/boinc"
}
