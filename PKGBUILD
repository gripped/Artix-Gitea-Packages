# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=mailman-s6
pkgver=20230829
pkgrel=1
pkgdesc="s6-rc service scripts for mailman"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-mailman')
conflicts=('init-mailman')
depends=('mailman3' 's6-base')
makedepends=('git')
_commit=8f5148af0d53c9bb9a77435c07ff8a1d8ab14632
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "mailman" "${pkgdir}"
}
