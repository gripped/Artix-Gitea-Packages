# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
pkgname=sane-s6
pkgver=20260522
pkgrel=1
pkgdesc="s6-rc service scripts for sane"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-sane')
conflicts=('init-sane')
depends=('sane' 's6-base')
makedepends=('git')
backup=('etc/s6/config/sane.conf')
_commit=526f2c6739762d59b8217b6cda7483bc542ad574
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('b1bc9b6afbddea3761df151dac2ae5aa8f153a6eaa84e78138e0db075dcbf31a')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "sane" "${pkgdir}"
}
