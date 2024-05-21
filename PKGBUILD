# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fcron-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for fcron"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fcron' 'dinit')
conflicts=('init-fcron' 'init-cron')
provides=('init-fcron' 'init-cron')
source=("fcron")
sha256sums=('415680673948cc640a5e15792f35fd952ced01867e4e4a59f6a9e7a5bb60ef3e')

package() {
    install -Dm644 fcron "$pkgdir/etc/dinit.d/fcron"
}
