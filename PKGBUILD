# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles
pkgver=2023.12
pkgrel=4
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
_commit=3fdf7003fac232c92c28fcc41bbdb2ed29e08564
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

# pkgver() {
#     date +%Y.%m
# }

package() {
    cd "${pkgname}"
    install -d "${pkgdir}"/usr/share/artools/iso-profiles
    cp -a {base,common,community,cinnamon,community-gtk,community-qt,lxde,lxqt,mate,plasma,xfce,netinstall} "${pkgdir}"/usr/share/artools/iso-profiles
}
