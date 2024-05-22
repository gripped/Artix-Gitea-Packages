# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lvm2-dinit
pkgver=20230907
pkgrel=5
pkgdesc="dinit stage1 scripts for lvm2"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('lvm2')
provides=('init-lvm2')
conflicts=('init-lvm2')
source=("lvm2-monitor"
        "lvm2"
        "lvmpolld"
        "lvmpolld-pre")
sha256sums=('36c603c8fb51d4156f4e4f2b93137e3c35b0fa20891b1c8ba8b85b3c986b574d'
            '603c01b4fc63c1657118467fd3c43153b55e6ab82d52ebaf528f22c685119e1a'
            '5f75bcb2859d57ce3885c0d656d591ba624f1a14d717a64f9c069ec51e04d13d'
            'bb4c061916beb1d78410885de7bfe7de49c094b6783d1fcb833b6addf531e88a')

package() {
    mkdir -p "$pkgdir/etc/dinit.d/mount.d/"
    ln -s ../lvm2 "$pkgdir/etc/dinit.d/mount.d/lvm2"
    install -Dm644 lvm2         "$pkgdir/etc/dinit.d/lvm2"
    install -Dm644 lvm2-monitor "$pkgdir/etc/dinit.d/lvm-monitor"
    install -Dm644 lvmpolld     "$pkgdir/etc/dinit.d/lvmpolld"
    install -Dm644 lvmpolld-pre "$pkgdir/etc/dinit.d/lvmpolld-pre"
}
