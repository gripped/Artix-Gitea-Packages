# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openldap-dinit
pkgver=20231104
pkgrel=1
pkgdesc="dinit service scripts for openldap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('openldap' 'dinit')
provides=('init-openldap')
conflicts=('init-openldap')
source=("slapd" "slapd-pre" "slapd.conf")
sha256sums=('dbde8a10a67754dc4a504ff6d9879e47d08b46f70fcf5dfec27d0b7c8718bd55'
            'fc129a2bbe87dd6309618b28729a51db3811417a2cfe767d7e88cfb781fead9e'
            'fdba67b98f918054c6030e984c982d880e6b085420cbf30705305d1fdef586a7')

package() {
    install -Dm644 slapd      "$pkgdir/etc/dinit.d/slapd"
    install -Dm644 slapd-pre  "$pkgdir/etc/dinit.d/slapd-pre"
    install -Dm644 slapd.conf "$pkgdir/etc/dinit.d/config/slapd.conf"
}
