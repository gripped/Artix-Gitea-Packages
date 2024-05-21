# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=php-fpm-dinit
pkgver=20211025
pkgrel=4
pkgdesc="dinit service scripts for php-fpm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('php-fpm' 'dinit')
conflicts=('init-php-fpm')
provides=('init-php-fpm')
source=("php-fpm")
sha256sums=('0fbd2d34ca17812d13922108d433d428ff3858922f559f900d5dc55f5a56f627')

package() {
    install -Dm644 php-fpm "$pkgdir/etc/dinit.d/php-fpm"
}
