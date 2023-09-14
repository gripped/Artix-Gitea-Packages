# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=v2ray-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for v2ray"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('v2ray' 'dinit')
conflicts=('init-v2ray')
provides=('init-v2ray')
source=("v2ray")
sha256sums=('ad718c08fae9462b54e1481d51160e8e0e2832259da69709f8b773384ea1f349')

package() {
    install -Dm644 v2ray "$pkgdir/etc/dinit.d/v2ray"
}
