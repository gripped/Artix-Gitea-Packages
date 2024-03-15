# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
pkgname=avahi-s6
pkgver=20240315
pkgrel=1
pkgdesc="s6-rc service scripts for avahi"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-avahi')
conflicts=('init-avahi')
depends=('avahi' 'dbus-s6' 's6-base')
makedepends=('git')
backup=('etc/s6/config/avahi.conf')
_commit=131347b78896704ffb6c3802a910c5919cd277e5
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "avahi" "${pkgdir}"
}
