# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles
pkgver=2025.01
pkgrel=1
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
_commit=632c3926c852ec624d06e5e9b3700cfc5aaf8e7c
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
