# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=powerdns-recursor-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for powerdns-recursor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('powerdns-recursor' 'dinit')
conflicts=('init-powerdns-recursor')
provides=('init-powerdns-recursor')
source=("pdns-recursor" "pdns-recursor-pre")
sha256sums=('63ea40ecc37c3df01b6dc077b5e84bf72367b17c9f3b062c89a0c74aca8bc428'
            '3f06d53d969d030217a754a7dd1a9fd489f2857e3cc2b03c6bd73782324d7782')

package() {
    install -Dm644 pdns-recursor     "$pkgdir/etc/dinit.d/pdns-recursor"
    install -Dm644 pdns-recursor-pre "$pkgdir/etc/dinit.d/pdns-recursor-pre"
}
