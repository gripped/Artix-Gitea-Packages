# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles
pkgver=2025.02
pkgrel=1
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
_commit=612820d05706414d19f92639f0a72cbf2fd9a714
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
