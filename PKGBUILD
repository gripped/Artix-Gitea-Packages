# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

_pkgbase=desktop-presets
_commit=ed954eefb7a65ff112d3b2987689f70e4c95b368

pkgname=artix-netinstall-presets
pkgver=2023.12
pkgrel=5
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
