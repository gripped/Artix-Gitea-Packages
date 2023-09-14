# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=sddm-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for sddm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sddm' 'init-logind')
provides=('init-sddm' 'init-displaymanager')
conflicts=('init-sddm' 'init-displaymanager')
source=("sddm" "sddm-pre")
sha256sums=('88787b449cfedcb1a67d52381ed9202c9871e182ebeaaef7441d0d5c6a4139ae'
            'b90d44d06d6087a036690bfc5c7dc2cd8f5374fcfd47ebdce419a2d99f7fb03d')

package() {
    install -Dm644 sddm     "$pkgdir/etc/dinit.d/sddm"
    install -Dm644 sddm-pre "$pkgdir/etc/dinit.d/sddm-pre"
}
