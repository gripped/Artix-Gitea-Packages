# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=krb5-dinit
pkgver=20230907
pkgrel=2
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
sha256sums=('8da78d49b342d6cabc99f62086bcda411a83f3fb697fb8c2cc4e91f3a94329bd'
            'b8d0678ec6dde421dc0ef79ab251b010399310493189f1c60840360b8381a6c3'
            'ac534cd232cfe32c2925c2aa4a204a42e300000ef861c9d66bb918daec7b3218')

package() {
    install -Dm644 kadmind "$pkgdir/etc/dinit.d/kadmind"
    install -Dm644 krb5kdc "$pkgdir/etc/dinit.d/krb5kdc"
    install -Dm644 kpropd  "$pkgdir/etc/dinit.d/kpropd"
}
