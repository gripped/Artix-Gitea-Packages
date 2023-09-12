# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=grafana-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for grafana"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('grafana' 'dinit')
conflicts=('init-grafana')
provides=('init-grafana')
source=("grafana")
sha256sums=('11fc194a5beaddb58ea58d0a6da238ed8520725ebbfa6e3132178069782f2fc5')

package() {
    install -Dm644 grafana "$pkgdir/etc/dinit.d/grafana"
}
