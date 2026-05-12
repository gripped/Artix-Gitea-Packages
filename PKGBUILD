# Maintainer: Nathan <ndownes@artixlinux.org>
pkgname=mopidy-s6
pkgver=20260512
pkgrel=1
pkgdesc="s6-rc service scripts for mopidy"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-mopidy')
conflicts=('init-mopidy')
depends=('mopidy' 's6-base')
makedepends=('git')
backup=('etc/s6/config/mopidy.conf')
_commit=22903adc87ffdd4774cc30c5da4b09889339670b
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('7ed937d8bb15ab5d229d1843df54cd491156f0635f8299e6dba5f983abcb70c2')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "mopidy" "${pkgdir}"
}
