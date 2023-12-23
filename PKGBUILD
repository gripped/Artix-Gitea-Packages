# Maintainer: nous <nous@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

_pkgbase=desktop-presets

pkgname=artix-netinstall-presets
pkgver=20231223
pkgrel=2
pkgdesc='Artix netinstall presets (KDE Plasma)'
arch=('any')
url="https://gitea.artixlinux.org/artix/desktop-presets"
license=('GPL')
makedepends=('git')
groups=('artix-style')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd ${_pkgbase}

    install -d "$pkgdir"/etc
    cp -vr netinstall/skel "$pkgdir"/etc
}
