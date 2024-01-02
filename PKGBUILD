# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles
pkgver=2024.01
pkgrel=2
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
_commit=e204d6b88926a766b0d515c54d4a6e01be788370
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    date +%Y.%m
}

package() {
    cd "${pkgname}"
    install -d "${pkgdir}"/usr/share/artools/iso-profiles
    cp -a {base,common,community,cinnamon,community-gtk,community-qt,lxde,lxqt,mate,plasma,xfce,netinstall} "${pkgdir}"/usr/share/artools/iso-profiles
}
