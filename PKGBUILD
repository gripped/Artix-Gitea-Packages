# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=power-profiles-daemon-s6
pkgver=20260826
pkgrel=1
pkgdesc="s6-rc service scripts for power-profiles-daemon"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-power-profiles-daemon')
conflicts=('init-power-profiles-daemon')
depends=('power-profiles-daemon' 'dbus-s6' 's6-base')
makedepends=('git')
backup=('etc/s6/config/power-profiles-daemon.conf')
_commit=1e9cfbb2fdcfeafed3f7ea897fece8aaf419b756
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('3b25fad860b5ce664b5b4841249cd23fa195c4861d704d46729b6207fec9f663')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "power-profiles-daemon" "${pkgdir}"
}
