# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=cryptsetup-s6
pkgver=20251213
pkgrel=1
pkgdesc="s6-rc service scripts for cryptsetup"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-cryptsetup')
conflicts=('init-cryptsetup')
depends=('cryptsetup' 's6-base')
makedepends=('git')
_commit=f647a5956f8ca1c6c32f91bc48831f5d2c82b59c
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('523081c0acd7907d9d3858d1f15db0eb949e69a0c573a802fae5d25e779189f2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "cryptsetup" "${pkgdir}"
}
