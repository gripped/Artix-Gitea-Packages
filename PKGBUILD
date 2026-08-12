# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: artoo <artoo@artixlinux.org> 
pkgname=s6-base
pkgver=3.3.3
pkgrel=1
pkgdesc='Packages, hooks, and scripts to define a basic s6 init system implementation for Artix Linux.'
url='https://gitea.artixlinux.org/artix/alpm-hooks'
arch=('any')
license=('GPL')
depends=('s6-contrib' 's6-frontend')
makedepends=('git')
provides=('svc-manager' 'init-rc')
conflicts=('svc-manager' 'init-rc')
_tag=3.2
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_tag")
sha256sums=('8959015f7fc8075dd5ee0abc53e7dd7e4d65b2feb53d5bb9bcd04535166bf371')

package() {
    cd "${srcdir}"/alpm-hooks
    DESTDIR="${pkgdir}" make install_s6
    install -v -d "${pkgdir}"/etc/s6/rc
}
