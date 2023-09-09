# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bind-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for bind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bind' 'dinit')
provides=('init-bind')
conflicts=('init-bind')
source=("named" "named-pre")
sha256sums=('669c54876e33cbd8ae6ebacecd0e82f3444eea345b6466c74303631cc55a270c'
            '3a14d84cfd8f407bbef0ac715787eedcfcb543002d70e63ff2edfd1ff3f0e6eb')

package() {
    install -Dm644 named     "$pkgdir/etc/dinit.d/named"
    install -Dm644 named-pre "$pkgdir/etc/dinit.d/named-pre"
}
