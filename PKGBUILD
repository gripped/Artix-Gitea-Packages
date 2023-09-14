# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=php-fpm-dinit
pkgver=20211025
pkgrel=3
pkgdesc="dinit service scripts for php-fpm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('php-fpm' 'dinit')
conflicts=('init-php-fpm')
provides=('init-php-fpm')
source=("php-fpm")
sha256sums=('cb23dc689701028d50db61c4d0534c7f8013fd5aae3947ef07bb91c06cde695f')

package() {
    install -Dm644 php-fpm "$pkgdir/etc/dinit.d/php-fpm"
}
