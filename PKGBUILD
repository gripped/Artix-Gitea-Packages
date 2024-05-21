# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mdadm-dinit
pkgver=20211029
pkgrel=2
pkgdesc="dinit service scripts for mdadm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('mdadm' 'dinit')
provides=('init-mdadm')
conflicts=('init-mdadm')
source=("mdadm")
sha256sums=('4f36cff8a5418c764c44dafda246a31ad43eb3bbdbc73415aaa1a38a90a2c571')

package() {
    install -Dm644 mdadm "$pkgdir/etc/dinit.d/mdadm"
}
