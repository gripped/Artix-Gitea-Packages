# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: artoo <artoo@artixlinux.org> 
pkgname=s6-base
pkgver=3.1
pkgrel=2
pkgdesc='Packages, hooks, and scripts to define a basic s6 init system implementation for Artix Linux.'
url='https://gitea.artixlinux.org/artix/alpm-hooks'
arch=('any')
license=('GPL')
depends=('s6-contrib' 's6-frontend')
makedepends=('git')
provides=('svc-manager' 'init-rc')
conflicts=('svc-manager' 'init-rc')
_commit=19c817747677e8776f4e8cddc8e6a0071ad416e6
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('7a7b78414b9de164be8b4c966deadb0a0d3b0cab8a07c268a0a4095548b13a69')

package() {
    cd "${srcdir}"/alpm-hooks
    DESTDIR="${pkgdir}" make install_s6
    install -v -d "${pkgdir}"/etc/s6/rc
}
