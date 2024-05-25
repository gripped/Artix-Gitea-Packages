# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=mailman3-dinit
pkgver=20240525
pkgrel=1
pkgdesc="dinit service script for mailman"
arch=('any')
url="https://artixlinux.org"
groups=('dinit-world')
provides=('init-mailman3')
conflicts=('init-mailman3')
depends=('mailman3' 'dinit')
makedepends=('git')
source=("mailman3")
sha256sums=('33f03076328389f91dee9ca831f669953f0bf2220ed399a82ea76d248ce0eb1e')

package() {
    install -Dm644 mailman3 "$pkgdir/etc/dinit.d/mailman3"
}
