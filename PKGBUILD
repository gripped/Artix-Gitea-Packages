# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mariadb-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service script for mariadb"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('mariadb' 'dinit')
groups=('dinit-world')
conflicts=('init-mariadb' 'init-mysql')
provides=('init-mariadb')
source=("mysqld" "mysqld-pre")
sha256sums=('984f87a8885e9a9dca7469bdc6bb630d6070509104cfff5ea0aad8c2dfd8bac3'
            '715f0bd69b2b3da353fb0f5e3a163edafcdfad45d5b0d2f3abeab73135bd9af0')

package() {
    install -Dm644 mysqld     "$pkgdir/etc/dinit.d/mysqld"
    install -Dm644 mysqld-pre "$pkgdir/etc/dinit.d/mysqld-pre"
}
