# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_commit=e75595d8a22f45ed2bcc7db39f124f75098a9af1

pkgname=iso-profiles
pkgver=2025.09
pkgrel=2
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    date +%Y.%m
}

package() {
    cd "${pkgname}"
    install -d "${pkgdir}"/usr/share/artools/iso-profiles
    cp -a {base,common,plasma,cinnamon,lxde,lxqt,mate,moksha,xfce} "${pkgdir}"/usr/share/artools/iso-profiles
}
