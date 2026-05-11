# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=cryptsetup-s6
pkgver=20260511
pkgrel=1
pkgdesc="s6-rc service scripts for cryptsetup"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-cryptsetup')
conflicts=('init-cryptsetup')
depends=('cryptsetup' 's6-base')
makedepends=('git')
_commit=9d4551b9673e6088802ca09e4dc2bc9ebdd0bbb1
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('0d88139bbdd59b6ee059731ee89a2695b83e34506041cc765f269352d0299f4f')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "cryptsetup" "${pkgdir}"
}
