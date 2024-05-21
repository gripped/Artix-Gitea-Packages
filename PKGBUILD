# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=xl2tpd-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for xl2tpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xl2tpd' 'dinit')
conflicts=('init-xl2tpd')
provides=('init-xl2tpd')
source=("xl2tpd")
sha256sums=('86287b87d7a42db49070c432479f08a8b1817ca8cda9468fa204a9b8cf244bc0')

package() {
    install -Dm644 xl2tpd "$pkgdir/etc/dinit.d/xl2tpd"
}
