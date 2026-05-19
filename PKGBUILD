# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: artoo <artoo@artixlinux.org> 
pkgname=s6-base
pkgver=3.2
pkgrel=1
pkgdesc='Packages, hooks, and scripts to define a basic s6 init system implementation for Artix Linux.'
url='https://gitea.artixlinux.org/artix/alpm-hooks'
arch=('any')
license=('GPL')
depends=('s6-contrib' 's6-frontend')
makedepends=('git')
provides=('svc-manager' 'init-rc')
conflicts=('svc-manager' 'init-rc')
_commit=e23d3d4c58d265175a67e8da87a749e6bcb6b436
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('3bbe1c5456ea69d42572e3a36af5301511ddb229c11cbab7621b79fb634a12ce')

package() {
    cd "${srcdir}"/alpm-hooks
    DESTDIR="${pkgdir}" make install_s6
    install -v -d "${pkgdir}"/etc/s6/rc
}
