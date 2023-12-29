# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

_pkgbase=desktop-presets
_commit=9a200fc1ca761366f1a24eafd24b906b119bb895

pkgname=artix-netinstall-presets
pkgver=2023.12
pkgrel=4
pkgdesc='Artix netinstall presets (KDE Plasma)'
arch=('any')
url="https://gitea.artixlinux.org/artix/desktop-presets"
license=('GPL')
makedepends=('git')
conflicts=('artix-qt-presets'
            'artix-gtk-presets'
            'artix-community-presets'
            'artix-desktop-presets')
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
