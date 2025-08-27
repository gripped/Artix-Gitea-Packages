# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_commit=9d5d76446d7e42a3b04fdb33d364361bdff8c102

pkgname=iso-profiles
pkgver=2025.08
pkgrel=4
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
    cp -a {base,common,plasma} "${pkgdir}"/usr/share/artools/iso-profiles
}
