# nous, 2025

pkgname=zramen
pkgdesc="Manage zram swap space"
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://github.com/atweiden/zramen"
license=('Unlicense')
source=("$url/releases/download/${pkgver}/zramen-${pkgver}.tar.gz")
sha256sums=('f93a7aa13cb94905fc62e5bf2967b5ea070b855aa89e6edff4177e4d57b8b486')

package() {
    echo "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 zramen -t "$pkgdir/usr/bin/"
}
