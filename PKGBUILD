# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=xl2tpd-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for xl2tpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xl2tpd' 'dinit')
conflicts=('init-xl2tpd')
provides=('init-xl2tpd')
source=("xl2tpd")
sha256sums=('6966007e9b7f9c31601737b264795452aa06c2f927925c8cef98fa8c035ce499')

package() {
    install -Dm644 xl2tpd "$pkgdir/etc/dinit.d/xl2tpd"
}
