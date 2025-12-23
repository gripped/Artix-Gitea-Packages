# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=lvm2-s6
pkgver=20251223
pkgrel=1
pkgdesc="s6-rc service scripts for lvm2"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-lvm2')
conflicts=('init-lvm2')
depends=('lvm2' 's6-base')
makedepends=('git')
backup=('etc/s6/config/lvm2.conf')
_commit=f647a5956f8ca1c6c32f91bc48831f5d2c82b59c
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('523081c0acd7907d9d3858d1f15db0eb949e69a0c573a802fae5d25e779189f2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "lvm2" "${pkgdir}"
}
