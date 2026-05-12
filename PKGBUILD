# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=xinetd-s6
pkgver=20260512
pkgrel=1
pkgdesc="s6-rc service scripts for xinetd"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-xinetd')
conflicts=('init-xinetd')
depends=('xinetd' 's6-base')
makedepends=('git')
backup=('etc/s6/config/xinetd.conf')
_commit=22903adc87ffdd4774cc30c5da4b09889339670b
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('7ed937d8bb15ab5d229d1843df54cd491156f0635f8299e6dba5f983abcb70c2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "xinetd" "${pkgdir}"
}
