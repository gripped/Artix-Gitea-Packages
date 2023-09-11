# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dns-over-https-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for dns-over-https"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dns-over-https' 'dinit')
conflicts=('init-dns-over-https')
provides=('init-dns-over-https')
source=("doh-client" "doh-server")
sha256sums=('72383a052c434376d79717785e18b82ea8eb3a7516374a243ed12e41e0b20197'
            '850853c1b9fec1b47af998548ab1b354fb2dc5420e75f9bcc611867ddb7e0ccb')

package() {
    install -Dm644 doh-client "$pkgdir/etc/dinit.d/doh-client"
    install -Dm644 doh-server "$pkgdir/etc/dinit.d/doh-server"
}
