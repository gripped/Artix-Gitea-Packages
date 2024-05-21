# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dns-over-https-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for dns-over-https"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dns-over-https' 'dinit')
conflicts=('init-dns-over-https')
provides=('init-dns-over-https')
source=("doh-client" "doh-server")
sha256sums=('80fc800168f7e6acd71b9b2a674189d1f7669e98a53c6cc4c5ad528ea62e1265'
            '090169184ac7372647f90c05e2ad63a31ee14c2ec5c0b0ac952c4ec15021b26a')

package() {
    install -Dm644 doh-client "$pkgdir/etc/dinit.d/doh-client"
    install -Dm644 doh-server "$pkgdir/etc/dinit.d/doh-server"
}
