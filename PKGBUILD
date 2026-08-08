# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=cryptsetup-s6
pkgver=20260808
pkgrel=1
pkgdesc="s6-rc service scripts for cryptsetup"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-cryptsetup')
conflicts=('init-cryptsetup')
depends=('cryptsetup' 's6-base')
makedepends=('git')
_commit=5c319c1654a1f793eabb268ec0e006e2d52d646c
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('d351820d051e6fcdb4a674ccf93dc6786ed409426af5bb7794f832f97d867928')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "cryptsetup" "${pkgdir}"
}
