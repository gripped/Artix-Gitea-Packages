# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=ly-s6
pkgver=20240824
pkgrel=1
pkgdesc="s6-rc service scripts for ly"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-ly')
conflicts=('init-ly')
depends=('ly' 's6-base')
makedepends=('git')
_commit=370540d8794305bb4d42f474ef8c205923c1e5ae
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('6729e07d2ebe819398b2e842f3f482a6f7afed637ca0fa0d252d158a62ee1948')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "ly" "${pkgdir}"
}
