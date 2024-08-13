# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=nvidia-utils-s6
pkgver=20240813
pkgrel=1
pkgdesc="s6-rc service scripts for nvidia-utils"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-nvidia-utils')
conflicts=('init-nvidia-utils')
depends=('nvidia-utils' 's6-base')
makedepends=('git')
backup=('etc/s6/config/nvidia-utils.conf')
_commit=d6243bf4266313ec9287bad8ddf37e090009ad5c
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "nvidia-utils" "${pkgdir}"
}
