# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20211025
pkgrel=5
pkgdesc="dinit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('dinit-system')
provides=('init-cryptsetup')
depends=('cryptsetup' 'dinit-rc')
conflicts=('init-cryptsetup')
source=('cryptsetup' 'cryptsetup.script')
optdepends=('lvm2-dinit: LVM support for encrypted filesystems')
sha256sums=('bf0f57ee0da387c41e34b278abd133909cc2cde3bd01b32572daa0f45f61d804'
            '7a48785c2f65fd9c64ca95e9b7b13b0eb21e09494fdce8ad70242fb5bee203c5')

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm755 "${srcdir}/cryptsetup.script" "${pkgdir}/usr/lib/dinit/cryptsetup"

    mkdir -p "$pkgdir/etc/dinit.d/mount.d"
    ln -sf ../cryptsetup "$pkgdir/etc/dinit.d/mount.d"
}
