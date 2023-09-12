# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=minidlna-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for minidlna"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('minidlna' 'dinit')
conflicts=('init-minidlna')
provides=('init-minidlna')
source=("minidlnad")
sha256sums=('6eacf37a871aac14207ab2e01e9e91abcd69ee3880ca2b3cd97b9b81356d2f72')

package() {
    install -Dm644 minidlnad "$pkgdir/etc/dinit.d/minidlnad"
}
