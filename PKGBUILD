# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
pkgname=dnsmasq-s6
pkgver=20251130
pkgrel=1
pkgdesc="s6-rc service scripts for dnsmasq"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-dnsmasq')
conflicts=('init-dnsmasq')
depends=('dnsmasq' 'dbus-s6' 's6-rc')
makedepends=('git')
backup=('etc/s6/config/dnsmasq.conf')
_commit=c091756a78411060fdb377ba5e3f6177706f99d0
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "dnsmasq" "${pkgdir}"
}
