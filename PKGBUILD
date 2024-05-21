# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=postgrey-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for postgrey"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('postgrey' 'dinit')
conflicts=('init-postgrey')
provides=('init-postgrey')
source=("postgrey")
sha256sums=('1a7fefbc3b169a7970fab1d0fef9688fc43728cbf3a581e1b9f92cbd38f7bfc6')

package() {
    install -Dm644 postgrey "$pkgdir/etc/dinit.d/postgrey"
}
