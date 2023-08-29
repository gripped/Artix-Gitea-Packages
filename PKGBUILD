# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=containerd-s6
pkgver=20230828
pkgrel=1
pkgdesc="s6-rc service scripts for containerd"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-containerd')
conflicts=('init-containerd')
depends=('containerd' 's6-base')
makedepends=('git')
backup=('etc/s6/config/containerd.conf')
_commit=ef91b7b77ce8295a7642a888868b104985cb9636
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "containerd" "${pkgdir}"
}
