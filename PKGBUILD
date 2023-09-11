# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=ddclient-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for ddclient"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ddclient' 'dinit')
conflicts=('init-ddclient')
provides=('init-ddclient')
source=("ddclient")
sha256sums=('166d87ddae9338974597a8212d284cb0c64b2a7d27339f5f0d426b727323d6f4')

package() {
    install -Dm644 ddclient "$pkgdir/etc/dinit.d/ddclient"
}
