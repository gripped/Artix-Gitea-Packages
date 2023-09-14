# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=prometheus-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for prometheus"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('prometheus' 'dinit')
groups=('dinit-world')
conflicts=('init-prometheus')
provides=('init-prometheus')
source=("prometheus")
sha256sums=('d6053af3d803e0ac420f48e1cec4f414858a09807a37fe8e16e893472a27177e')

package() {
    install -Dm644 prometheus "$pkgdir/etc/dinit.d/prometheus"
}
