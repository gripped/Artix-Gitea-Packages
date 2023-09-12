# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=nsd-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for nsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('nsd' 'dinit')
conflicts=('init-nsd')
provides=('init-nsd')
source=("nsd" "nsd-pre")
sha256sums=('6bb08e1f26607f439fe2a8403f20bbf4f727386d4086368851e9bb8ed9613e67'
            '3319a9ac8dbc233a4dbf0b921d11b6d9cebd74c7a25edd33541a2a7928dabe6f')

package() {
    install -Dm644 nsd     "$pkgdir/etc/dinit.d/nsd"
    install -Dm644 nsd-pre "$pkgdir/etc/dinit.d/nsd-pre"
}
