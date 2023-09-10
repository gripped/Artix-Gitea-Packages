# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20211025
pkgrel=2
pkgdesc="dinit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('dinit-system')
provides=('init-cryptsetup')
depends=('cryptsetup' 'dinit-rc')
conflicts=('init-cryptsetup')
source=('cryptsetup' 'cryptsetup-script')
optdepends=('lvm2-dinit: LVM support for encrypted filesystems')
sha256sums=('0593ce387724adaab6d69b87f695c7802ab3069bfe69bf45f5314b358ca2f494'
            '6fbf1c18607f400548c030395d184c1cbb4580c983b99ba0c813b0d88e3986a7')

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm755 "${srcdir}/cryptsetup-script" "${pkgdir}/etc/dinit.d/scripts/cryptsetup"

    mkdir -p "$pkgdir/etc/dinit.d/mount.d"
    ln -sf ../cryptsetup "$pkgdir/etc/dinit.d/mount.d"
}
