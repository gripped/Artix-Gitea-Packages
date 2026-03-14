# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=samba-dinit
pkgver=20260314
pkgrel=1
pkgdesc="dinit service scripts for samba"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('samba' 'dinit')
conflicts=('init-samba')
provides=('init-samba')
source=("smbd"
        "nmbd"
        "samba"
        "winbindd"
        "samba-pre")
sha256sums=('5b4815892a55308565e943abc514e177cbac97677b056f800e6d35f8f390fc91'
            '93dbbf967355f90a5b0c1d5a1640e2f4c0d3fbdd377ab4126eec09b9881692ba'
            'd3a2da93b44c5265755ac5414794391f4bab246141dfaca3dd33e879cec13e2f'
            '5cf702fb0c12ec1fc6df2a8084ca4e614374a221a8cc986a5bbc08d9c3a5dad2'
            '7ad7c855651996ac6b65f2a1af5d7ffd7bd7f3d2fc63a9c350bc5414cf715e77')

package() {
    install -Dm644 smbd      "$pkgdir/etc/dinit.d/smbd"
    install -Dm644 nmbd      "$pkgdir/etc/dinit.d/nmbd"
    install -Dm644 samba     "$pkgdir/etc/dinit.d/samba"
    install -Dm644 winbindd  "$pkgdir/etc/dinit.d/winbindd"
    install -Dm644 samba-pre "$pkgdir/etc/dinit.d/samba-pre"
}
