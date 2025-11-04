# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=nfs-utils-s6
pkgver=20251104
pkgrel=1
pkgdesc="s6-rc service scripts for nfs-utils"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-nfs-utils')
conflicts=('init-nfs-utils')
depends=('nfs-utils' 'device-mapper-s6' 'rpcbind-s6' 's6-base')
makedepends=('git')
backup=('etc/s6/config/nfs-utils.conf')
_commit=85f1e9afbe29108779274a3f56b9fc3a06f660b6
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('357643ef79fc3cf29ac35e0b843d6f1b8151b33bdeaf02e04c00324a75f61c63')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "nfs-utils" "${pkgdir}"
}
