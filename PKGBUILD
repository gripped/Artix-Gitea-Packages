# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20240522
pkgrel=1
pkgdesc="dinit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('dinit-system')
provides=('init-cryptsetup')
depends=('cryptsetup-scripts' 'dinit-rc')
conflicts=('init-cryptsetup')
source=('cryptsetup' 'cryptsetup-early' 'cryptsetup.script')
optdepends=('lvm2-dinit: LVM support for encrypted filesystems')
sha256sums=('71255251e4953d0b6cfea6b9af71848ca9ae5ef5d1227c9d1feebc9f47578e10'
            '40b64eac843e0df65b04ca8a1c8655b10bcd72a3969299cfb572c3ce0c948266'
            'd966f2d0325a18808252251541acb74752e15bbf29d3bfae9407f5fdbe9d2ed6')

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm644 "${srcdir}/cryptsetup-early" "${pkgdir}/etc/dinit.d/cryptsetup-early"
    install -Dm755 "${srcdir}/cryptsetup.script" "${pkgdir}/usr/lib/dinit/cryptsetup"
}
