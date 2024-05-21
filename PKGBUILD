# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openldap-dinit
pkgver=20231112
pkgrel=2
pkgdesc="dinit service scripts for openldap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('openldap' 'dinit')
provides=('init-openldap')
conflicts=('init-openldap')
source=("slapd" "slapd.script" "slapd.conf")
sha256sums=('fd07936049d9ed888a8eadade2570b7e7121fc14fe1f2fc7854f6243384cac23'
            '67d680cbe866e87e2f1ec7af0e2ab3aa79dba1af7815b03a37c3598308647001'
            'fdba67b98f918054c6030e984c982d880e6b085420cbf30705305d1fdef586a7')

package() {
    install -Dm644 slapd        "$pkgdir/etc/dinit.d/slapd"
    install -Dm755 slapd.script "$pkgdir/usr/lib/dinit/slapd"
    install -Dm644 slapd.conf   "$pkgdir/etc/dinit.d/config/slapd.conf"
}
