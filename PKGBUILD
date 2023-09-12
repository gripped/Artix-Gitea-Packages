# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lvm2-dinit
pkgver=20230907
pkgrel=1
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
sha256sums=('af2ba17663d24e0117536493a446a2c9d5700c65d0407f4e23bbb3f09fb74d0f'
            'bd518c7a54f7b304a3f8807cb2b24ae90a883c6237ef20bbb0b80a0a97b7c521'
            '230580fa7c579518d503a374044d14de96c8bb03c53089288cf525eb4332c4a8'
            '0101dc03ee69fdccb817956f62c6ea3dd610f80caf6b7b40226d2a512897c88c')

package() {
    mkdir -p "$pkgdir/etc/dinit.d/mount.d/"
    ln -s ../lvm2 "$pkgdir/etc/dinit.d/mount.d/lvm2"
    install -Dm644 lvm2         "$pkgdir/etc/dinit.d/lvm2"
    install -Dm644 lvm2-monitor "$pkgdir/etc/dinit.d/lvm-monitor"
    install -Dm644 lvmpolld     "$pkgdir/etc/dinit.d/lvmpolld"
    install -Dm644 lvmpolld-pre "$pkgdir/etc/dinit.d/lvmpolld-pre"
}
