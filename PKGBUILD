# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fcron-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for fcron"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fcron' 'dinit')
conflicts=('init-fcron' 'init-cron')
provides=('init-fcron' 'init-cron')
source=("fcron")
sha256sums=('12a8de82a598e6162658e1f6a6feb78d3adb66cf3167cc80a31e904cd876d450')

package() {
    install -Dm644 fcron "$pkgdir/etc/dinit.d/fcron"
}
