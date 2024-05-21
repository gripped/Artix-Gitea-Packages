# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=privoxy-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for privoxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('privoxy' 'dinit')
conflicts=('init-privoxy')
provides=('init-privoxy')
source=("privoxy")
sha256sums=('3093ea61003714f435e33128a13a74a2311a7f2f79df9550650d7913cf6f45c1')

package() {
    install -Dm644 privoxy "$pkgdir/etc/dinit.d/privoxy"
}
