# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lighttpd-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for lighttpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dinit' 'lighttpd')
provides=('init-lighttpd')
conflicts=('init-lighttpd')
source=("lighttpd")
sha256sums=('69abbf812c28e0eab7777065df31a49668f4c551a7eec23101d1b7c9b3147827')

package() {
    install -Dm644 lighttpd "$pkgdir/etc/dinit.d/lighttpd"
}
