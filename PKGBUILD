# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postgresql-dinit
pkgver=20240412
pkgrel=1
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
            '8614cb03c8b9e6b6c77cb7ccabdf0f82df311b21239185ab91e964a0c881883a'
            'd22862df8410a739a311326b363e2c2be0575224ad201200de87b7c8ff1cad85'
            '7921ceded142ed84645b5a26ae846d1ed620e23b6528d2b7b949df642fb29053'
            '5118255682e896e0ab9ea1c456535f5211a83f753d8a848bbdad7aa44bb7c619')

package() {
    install -Dm644 postgres            "$pkgdir/etc/dinit.d/postgres"
    install -Dm644 postgres.conf       "$pkgdir/etc/dinit.d/config/postgres.conf"
    install -Dm755 postgres.script     "$pkgdir/usr/lib/dinit/postgres"
    install -Dm644 postgres-pre        "$pkgdir/etc/dinit.d/postgres-pre"
    install -Dm755 postgres-pre.script "$pkgdir/usr/lib/dinit/pre/postgres"
}
