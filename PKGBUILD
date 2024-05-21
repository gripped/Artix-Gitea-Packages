# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=webhook-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for webhook"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('webhook' 'dinit')
conflicts=('init-webhook')
provides=('init-webhook')
source=("webhook")
sha256sums=('e04b05040dce96039d66d60a0bac8bd0e2a34a5a69d4fe48c3519b4363acf7e6')

package() {
    install -Dm644 webhook "$pkgdir/etc/dinit.d/webhook"
}
