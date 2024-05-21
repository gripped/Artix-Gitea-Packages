# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postgresql-dinit
pkgver=20240412
pkgrel=2
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
sha256sums=('3fbddbdbe3bbc269ddddd8b9654e744d8c2c9955f5c8df25e474b18776a180e9'
            '8614cb03c8b9e6b6c77cb7ccabdf0f82df311b21239185ab91e964a0c881883a'
            'd22862df8410a739a311326b363e2c2be0575224ad201200de87b7c8ff1cad85'
            '5351e4009e6b3dfec99bb2370a369abe278ee0e64965163aedf54840ff6d20a6'
            '5118255682e896e0ab9ea1c456535f5211a83f753d8a848bbdad7aa44bb7c619')

package() {
    install -Dm644 postgres            "$pkgdir/etc/dinit.d/postgres"
    install -Dm644 postgres.conf       "$pkgdir/etc/dinit.d/config/postgres.conf"
    install -Dm755 postgres.script     "$pkgdir/usr/lib/dinit/postgres"
    install -Dm644 postgres-pre        "$pkgdir/etc/dinit.d/postgres-pre"
    install -Dm755 postgres-pre.script "$pkgdir/usr/lib/dinit/pre/postgres"
}
