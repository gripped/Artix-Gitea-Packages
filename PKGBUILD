# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mariadb-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service script for mariadb"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('mariadb' 'dinit')
groups=('dinit-world')
conflicts=('init-mariadb' 'init-mysql')
provides=('init-mariadb')
source=("mysqld" "mysqld-pre")
sha256sums=('b5335b8de2ef485d8a657000da91322b623a5de97a9cabe745b2dc9debc754c1'
            '0a80f285de38eccb1cf7aa7caae876394401b6013a63555e810a0e3d6174e674')

package() {
    install -Dm644 mysqld     "$pkgdir/etc/dinit.d/mysqld"
    install -Dm644 mysqld-pre "$pkgdir/etc/dinit.d/mysqld-pre"
}
