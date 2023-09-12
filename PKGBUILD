# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=espeakup-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service scripts for espeakup"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('espeakup' 'dinit')
conflicts=('init-espeakup')
provides=('init-espeakup')
source=("espeakup" "espeakup-pre")
sha256sums=('9ec83332499e2bde163196e06a30cc10b9caeba363a916856cd87a2027fbb953'
            'dd27175f62c29efc2ecd50229e465a7e41bfbb2c60c269894be7bcb62f6f998a')

package() {
    install -Dm644 espeakup     "$pkgdir/etc/dinit.d/espeakup"
    install -Dm644 espeakup-pre "$pkgdir/etc/dinit.d/espeakup-pre"
}
