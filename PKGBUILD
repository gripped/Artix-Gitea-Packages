# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20230924
pkgrel=1
pkgdesc="dinit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('dinit-system')
provides=('init-cryptsetup')
depends=('cryptsetup' 'dinit-rc')
conflicts=('init-cryptsetup')
source=('cryptsetup' 'cryptsetup.script' 'crypttab.5')
optdepends=('lvm2-dinit: LVM support for encrypted filesystems')
sha256sums=('bf0f57ee0da387c41e34b278abd133909cc2cde3bd01b32572daa0f45f61d804'
            '1209f0a7dbac7e14f66d864ad18c08c7883b22920422c813e92ced5efb081ffd'
            '7beaf601ca9920f5b09b64a031cca62808dfea4e95868f03ae7fdc99545f5198')

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm755 "${srcdir}/cryptsetup.script" "${pkgdir}/usr/lib/dinit/cryptsetup"
    install -Dm644 "${srcdir}/crypttab.5" "${pkgdir}/usr/share/man/man5/crypttab.5"

    mkdir -p "$pkgdir/etc/dinit.d/mount.d"
    ln -sf ../cryptsetup "$pkgdir/etc/dinit.d/mount.d"
}
