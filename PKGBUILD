# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=cpupower-s6
pkgver=20231231
pkgrel=1
pkgdesc="s6-rc service scripts for cpupower"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-cpupower')
conflicts=('init-cpupower')
depends=('cpupower' 's6-base')
makedepends=('git')
_commit=09a504e555f361938ec2eac2674fe006b8866035
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "cpupower" "${pkgdir}"
}
