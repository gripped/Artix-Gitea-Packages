# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
pkgname=unbound-s6
pkgver=20260526
pkgrel=1
pkgdesc="s6-rc service scripts for unbound"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-unbound')
conflicts=('init-unbound')
depends=('unbound' 's6-base')
makedepends=('git')
backup=('etc/s6/config/unbound.conf')
_commit=c6fb1a4d1d5344858ed0f07635963c7cf585f889
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('05197163cabb08a855ed4ffa4e695afb9d9b6abf1452194323f55a6afa6b64f2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "unbound" "${pkgdir}"
}
