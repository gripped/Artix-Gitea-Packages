# Maintainer: artoo <artoo@artixlinux.org>

pkgname=(artix-archlinux-support lib32-artix-archlinux-support)
pkgver=4.2
pkgrel=1
arch=('any')
pkgdesc='Add arch linux repo support'
license=('GPL')
url='https://gitea.artixlinux.org/artix'
depends=('archlinux-keyring' 'archlinux-mirrorlist' 'etmpfiles' 'esysusers' 'init-logind')
source=(arch-repos-install.hook
        arch-repos-hook.script
        arch-release)
sha256sums=('0f98eb7e798815d217a527f81ee59edb9499a93d2f2331cc0b7cfb2b526ef18f'
            'edad7529e9070ba039d444761c59d1b1b117fd9b3a751de5ec24d3044b453cc5'
            '64b34944c9ea19083979bd05e8c05361f5f1efd13354d71f6490ddd239fb31c2')

package_artix-archlinux-support() {
    provides=('arch-release-dummy' 'systemd' 'systemd-libs')
    conflicts=('arch-release-dummy' 'systemd' 'systemd-libs')
    replaces=('arch-release-dummy')

    # pacman hooks
    install -Dm755 ${srcdir}/arch-repos-hook.script "$pkgdir"/usr/share/libalpm/scripts/arch-repos-hook
    install -Dm644 -t "$pkgdir"/usr/share/libalpm/hooks ${srcdir}/*.hook

    # compat symlinks
    install -d ${pkgdir}/usr/bin
    ln -snf /usr/bin/esysusers "${pkgdir}"/usr/bin/systemd-sysusers
    ln -snf /usr/bin/etmpfiles "${pkgdir}"/usr/bin/systemd-tmpfiles

    install -Dm644 arch-release "${pkgdir}"/etc/arch-release
}

package_lib32-artix-archlinux-support() {
    depends=('lib32-elogind')
    provides=('lib32-systemd')
    conflicts=('lib32-systemd')
}
