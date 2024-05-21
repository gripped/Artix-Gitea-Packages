# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=powerdns-recursor-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for powerdns-recursor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('powerdns-recursor' 'dinit')
conflicts=('init-powerdns-recursor')
provides=('init-powerdns-recursor')
source=("pdns-recursor" "pdns-recursor-pre")
sha256sums=('1be85038510cfc422faa752dde1645c88b9a962f522e0e19a5c106d44f4b9e00'
            '445373ee9d8581075c38df6dead2d44ef76f57759c30c647807d51de1618f9fb')

package() {
    install -Dm644 pdns-recursor     "$pkgdir/etc/dinit.d/pdns-recursor"
    install -Dm644 pdns-recursor-pre "$pkgdir/etc/dinit.d/pdns-recursor-pre"
}
