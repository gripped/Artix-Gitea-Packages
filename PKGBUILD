# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postgresql-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for postgresql"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('postgresql' 'dinit')
conflicts=('init-postgresql')
provides=('init-postgresql')
backup=('etc/dinit.d/config/postgres.conf')
source=("postgres"
        "postgres.script"
        "postgres.conf"
        "postgres-pre"
        "postgres-pre.script")
sha256sums=('24430b5ee05d23fe483fa9a0dce6e6e32f440c314dc3c700d509a04f93b23648'
            'f00f63404f610e6d730b8b461a940e5583017e596a457221a43bbef4e5ddf6fc'
            'd22862df8410a739a311326b363e2c2be0575224ad201200de87b7c8ff1cad85'
            '7921ceded142ed84645b5a26ae846d1ed620e23b6528d2b7b949df642fb29053'
            '44777ddbdeda2dfec690d49983f8a15835e0058e06b9a0d95830b9f8d5ced672')

package() {
    install -Dm644 postgres            "$pkgdir/etc/dinit.d/postgres"
    install -Dm644 postgres.conf       "$pkgdir/etc/dinit.d/config/postgres.conf"
    install -Dm755 postgres.script     "$pkgdir/usr/lib/dinit/postgres"
    install -Dm644 postgres-pre        "$pkgdir/etc/dinit.d/postgres-pre"
    install -Dm755 postgres-pre.script "$pkgdir/usr/lib/dinit/pre/postgres"
}
