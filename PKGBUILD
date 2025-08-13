# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=syncthing-s6
pkgver=20250813
pkgrel=1
pkgdesc="s6-rc service scripts for syncthing"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-syncthing')
conflicts=('init-syncthing')
depends=('syncthing' 's6-base')
makedepends=('git')
backup=('etc/s6/config/syncthing.conf')
_commit=9b135a47a3a94917b36d2545c7d7ea30e650cba6
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('5178be4d2fe11108470ce4d39b61b5f38025009f643367aad920e0b229b73d53')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "syncthing" "${pkgdir}"
}
