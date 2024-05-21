# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=grafana-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for grafana"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('grafana' 'dinit')
conflicts=('init-grafana')
provides=('init-grafana')
source=("grafana")
sha256sums=('733c44d00bb3af1d3166bd9206dd2dadb611601c13782cba238e609d2d675d2e')

package() {
    install -Dm644 grafana "$pkgdir/etc/dinit.d/grafana"
}
