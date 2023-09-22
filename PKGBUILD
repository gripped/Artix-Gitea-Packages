# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20211025
pkgrel=4
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
sha256sums=('04e2d2c87f38cc38af3453efa8ccb68efc5aec883b5d29b75c9e412a0f627342'
            '7a48785c2f65fd9c64ca95e9b7b13b0eb21e09494fdce8ad70242fb5bee203c5')

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm755 "${srcdir}/cryptsetup-script" "${pkgdir}/etc/dinit.d/scripts/cryptsetup"

    mkdir -p "$pkgdir/etc/dinit.d/mount.d"
    ln -sf ../cryptsetup "$pkgdir/etc/dinit.d/mount.d"
}
