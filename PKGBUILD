# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=nfs-utils-s6
pkgver=20260521
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
_commit=be97a7e66afad65f961e1ab95152de2cb8afd77f
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('1d3429263276b51b129a4f74a36f8af99d52b3ab5e3adf1fa226b040db37f1d0')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "nfs-utils" "${pkgdir}"
}
