# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=webhook-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for webhook"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('webhook' 'dinit')
conflicts=('init-webhook')
provides=('init-webhook')
source=("webhook")
sha256sums=('7e0eda1bf61d4a542c49f1b81fc09225dbf530ce1ed926673547611e04478de2')

package() {
    install -Dm644 webhook "$pkgdir/etc/dinit.d/webhook"
}
