# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dnscrypt-proxy-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service scripts for dnscrypt-proxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('dnscrypt-proxy' 'dinit')
groups=('dinit-world')
conflicts=('init-dnscrypt-proxy')
provides=('init-dnscrypt-proxy')
source=("dnscrypt-proxy")
sha256sums=('af2f53797333deec677730c28f3437c96f3bbcd938012459bc3263a8d9ee56a9')

package() {
    install -Dm644 dnscrypt-proxy "$pkgdir/etc/dinit.d/dnscrypt-proxy"
}
