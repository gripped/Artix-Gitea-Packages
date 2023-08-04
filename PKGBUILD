# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=lxdm-s6
pkgver=20230804
pkgrel=1
pkgdesc="s6-rc service scripts for lxdm"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-galaxy')
provides=('init-lxdm')
conflicts=('init-lxdm')
depends=('lxdm-gtk3' 's6-base')
makedepends=('git')
_commit=8cb0a36d349e1187f872aaf49f4d8d0409389ace
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "lxdm" "${pkgdir}"
}
