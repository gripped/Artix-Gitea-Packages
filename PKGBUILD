# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: artoo <artoo@artixlinux.org> 
pkgname=s6-base
pkgver=3.1
pkgrel=3
pkgdesc='Packages, hooks, and scripts to define a basic s6 init system implementation for Artix Linux.'
url='https://gitea.artixlinux.org/artix/alpm-hooks'
arch=('any')
license=('GPL')
depends=('s6-contrib' 's6-frontend')
makedepends=('git')
provides=('svc-manager' 'init-rc')
conflicts=('svc-manager' 'init-rc')
_commit=8816a7a9228c0f3f24072fefcfee3af76876fd6e
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('68463660155759cd6c259f10ff505e89bc2a5200cf09aeb6620845d4e0aa1cd2')

package() {
    cd "${srcdir}"/alpm-hooks
    DESTDIR="${pkgdir}" make install_s6
    install -v -d "${pkgdir}"/etc/s6/rc
}
