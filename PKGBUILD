# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=samba-dinit
pkgver=20211030
pkgrel=3
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
        "samba-pre")
sha256sums=('3328da37b1b4150e4b706bfd2fa8e1ade0b904d54548ea23a2240333662847a3'
            '371cc96655681ecf22626c9a853e99d1de53c77c6338818359ae4860b661aa60'
            '7653797db0d167a682232cc8f010ee6ed616c74c4b1af808448a34cbbbfd7553')

package() {
    install -Dm644 smbd      "$pkgdir/etc/dinit.d/smbd"
    install -Dm644 nmbd      "$pkgdir/etc/dinit.d/nmbd"
    install -Dm644 samba-pre "$pkgdir/etc/dinit.d/samba-pre"
}
