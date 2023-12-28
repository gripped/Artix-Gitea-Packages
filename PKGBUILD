# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

_pkgbase=desktop-presets
_commit=dbf72e9978f87ff216f29b9f4d625faa2bd4309f

pkgname=artix-netinstall-presets
pkgver=2023.12
pkgrel=2
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
