# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lighttpd-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for lighttpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'lighttpd')
provides=('init-lighttpd')
conflicts=('init-lighttpd')
source=("lighttpd")
sha256sums=('46568757eb8e50e2b681fcf3bce676ecbb713761afa768dcaf93791f0d735a75')

package() {
    install -Dm644 lighttpd "$pkgdir/etc/dinit.d/lighttpd"
}
