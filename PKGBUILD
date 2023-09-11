# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=darkhttpd-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for darkhttpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('darkhttpd' 'dinit')
conflicts=('init-darkhttpd')
provides=('init-darkhttpd')
backup=('etc/dinit.d/config/darkhttpd.conf')
source=("darkhttpd" "darkhttpd.conf")
sha256sums=('ef9400abe00c76e3fd86002256f41eb38bfbf0e4ccfbaf49083085663d5285d7'
            '2696bbf5c11d48504c25a0f3cc70d06cc3cda67658f170e9f0f7334d75766fd3')

package() {
    install -Dm644 darkhttpd      "$pkgdir/etc/dinit.d/darkhttpd"
    install -Dm644 darkhttpd.conf "$pkgdir/etc/dinit.d/config/darkhttpd.conf"
}
