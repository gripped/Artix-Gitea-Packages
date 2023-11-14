# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openldap-dinit
pkgver=20231112
pkgrel=1
pkgdesc="dinit service scripts for openldap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('openldap' 'dinit')
provides=('init-openldap')
conflicts=('init-openldap')
source=("slapd" "slapd.script" "slapd.conf")
sha256sums=('8ed2a7ae0f2c752c66b25168a46be3343ba4ccc9a26fa49e8023b88a10c49e34'
            '67d680cbe866e87e2f1ec7af0e2ab3aa79dba1af7815b03a37c3598308647001'
            'fdba67b98f918054c6030e984c982d880e6b085420cbf30705305d1fdef586a7')

package() {
    install -Dm644 slapd        "$pkgdir/etc/dinit.d/slapd"
    install -Dm755 slapd.script "$pkgdir/usr/lib/dinit/slapd"
    install -Dm644 slapd.conf   "$pkgdir/etc/dinit.d/config/slapd.conf"
}
