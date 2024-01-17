# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles
pkgver=2024.01
pkgrel=3
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
_commit=161fb6be9106ce93be17da5a7c6564a5e773e9b4
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    date +%Y.%m
}

package() {
    cd "${pkgname}"
    install -d "${pkgdir}"/usr/share/artools/iso-profiles
#     cp -a {base,common,community,cinnamon,community-gtk,community-qt,lxde,lxqt,mate,plasma,xfce,netinstall} "${pkgdir}"/usr/share/artools/iso-profiles
    cp -a {base,common,plasma} "${pkgdir}"/usr/share/artools/iso-profiles
}
