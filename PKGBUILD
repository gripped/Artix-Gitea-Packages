# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-dinit
pkgver=20230924
pkgrel=3
pkgdesc="dinit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('dinit-system')
provides=('init-cryptsetup')
depends=('cryptsetup' 'dinit-rc')
makedepends=('scdoc')
conflicts=('init-cryptsetup')
source=('cryptsetup' 'cryptsetup.script' 'crypttab.5.scd')
optdepends=('lvm2-dinit: LVM support for encrypted filesystems')
sha256sums=('394f46c2d05057f5d4dd4b8bd6eb3e4bf1d5f53a546c97c83855654b504251e9'
            '1209f0a7dbac7e14f66d864ad18c08c7883b22920422c813e92ced5efb081ffd'
            '078889a03993f7a316a5ecee224632d3cdebccfc9241b9afaf98cd7e156b6eaa')

build() {
    scdoc < crypttab.5.scd > crypttab.5
}

package() {
    install -Dm644 "${srcdir}/cryptsetup" "${pkgdir}/etc/dinit.d/cryptsetup"
    install -Dm755 "${srcdir}/cryptsetup.script" "${pkgdir}/usr/lib/dinit/cryptsetup"
    install -Dm644 "${srcdir}/crypttab.5" "${pkgdir}/usr/share/man/man5/crypttab.5"

    mkdir -p "$pkgdir/etc/dinit.d/mount.d"
    ln -sf ../cryptsetup "$pkgdir/etc/dinit.d/mount.d"
}
