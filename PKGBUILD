# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=prometheus-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service script for prometheus"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('prometheus' 'dinit')
groups=('dinit-world')
conflicts=('init-prometheus')
provides=('init-prometheus')
source=("prometheus")
sha256sums=('fa615318f71a55bd20aedb2ac7dd257b2ee8dd2a4a7727a6887d8c31c89c1000')

package() {
    install -Dm644 prometheus "$pkgdir/etc/dinit.d/prometheus"
}
