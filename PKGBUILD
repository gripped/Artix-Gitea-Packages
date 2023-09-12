# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openldap-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for openldap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('openldap' 'dinit')
provides=('init-openldap')
conflicts=('init-openldap')
source=("slapd" "slapd-pre")
sha256sums=('a9d22adc56b0d3d0c41513c9f29b8eb4b3c2b526dd735a67712148660f530c06'
            '8cd16bc2f1f908224437e7d5b34b7ab27f414f2b89238fff25c04c731619a090')

package() {
    install -Dm644 slapd     "$pkgdir/etc/dinit.d/slapd"
    install -Dm644 slapd-pre "$pkgdir/etc/dinit.d/slapd-pre"
}
