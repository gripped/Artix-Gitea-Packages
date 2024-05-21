# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=acpid-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service script for acpid"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('acpid' 'dinit')
groups=('dinit-world')
provides=('init-acpid')
conflicts=('init-acpid')
source=("acpid")
sha256sums=('6f40f8cc0741be6ba9cc6931be8ff5bc3ee79f98c4b056f740a4c28d1c4c7f32')

package() {
    install -Dm644 acpid "$pkgdir/etc/dinit.d/acpid"
}
