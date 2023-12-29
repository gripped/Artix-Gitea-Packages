# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

_pkgbase=desktop-presets
_commit=41e2385f1da57d7d5bcf5fe51e0ea2bf95150677

pkgname=artix-netinstall-presets
pkgver=2023.12
pkgrel=3
pkgdesc='Artix netinstall presets (KDE Plasma)'
arch=('any')
url="https://gitea.artixlinux.org/artix/desktop-presets"
license=('GPL')
makedepends=('git')
groups=('artix-style')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

# pkgver() {
#     date +%Y.%m
# }

package() {
    cd ${_pkgbase}

    install -d "$pkgdir"/etc
    cp -vr netinstall/skel "$pkgdir"/etc
}
