# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nginx-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for nginx"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('nginx' 'dinit')
conflicts=('init-nginx')
provides=('init-nginx')
source=("nginx")
sha256sums=('afbf0bdf7138715d245142933e355cbf64fccd8fe890366792dba8597819ec4d')

package() {
    install -Dm644 nginx "$pkgdir/etc/dinit.d/nginx"
}
