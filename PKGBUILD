# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributer: John Smith <promisedneverland@disroot.org>
pkgname=trojan-s6
pkgver=20260512
pkgrel=1
pkgdesc="s6-rc service scripts for trojan"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
license=(GPL)
groups=('s6-world')
provides=('init-trojan')
conflicts=('init-trojan')
depends=('trojan' 's6-base')
makedepends=('git')
backup=('etc/s6/config/trojan.conf')
_commit=22903adc87ffdd4774cc30c5da4b09889339670b
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('7ed937d8bb15ab5d229d1843df54cd491156f0635f8299e6dba5f983abcb70c2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "trojan" "${pkgdir}"
}
