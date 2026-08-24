# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=power-profiles-daemon-s6
pkgver=20260824
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
_commit=5ea9f17d8d3ea6de722b6762e752bf51c421157a
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('4694b118a8fcbbc6a66647e93a5906d9e9809da9b1a04a1ebcf75ac2a376dc35')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "power-profiles-daemon" "${pkgdir}"
}
