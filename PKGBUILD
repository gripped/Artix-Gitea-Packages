# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=krb5-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for krb5"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('krb5' 'dinit')
provides=('init-krb5')
conflicts=('init-krb5')
source=("kadmind"
        "krb5kdc"
        "kpropd")
sha256sums=('127a6fc8f9742f1b62609ae746c4f77c7f8c39114808fa90a91c17bcd39f3dcd'
            'acaf098e3c6ae1e0d4094058ae710931443ee61a094a682c3f6f47aaef5f71b5'
            '79f7d26405f82d7175ff25c0b375cb085b8ce8d17e3968cee5a67421d2edf8fc')

package() {
    install -Dm644 kadmind "$pkgdir/etc/dinit.d/kadmind"
    install -Dm644 krb5kdc "$pkgdir/etc/dinit.d/krb5kdc"
    install -Dm644 kpropd  "$pkgdir/etc/dinit.d/kpropd"
}
