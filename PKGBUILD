# Maintainer: Dudemanguy <dudemanguy@artixlinux.org> 
# Contributor: Nathan Owens <ndowens@artixlinux.org> 
pkgname=atftp-s6
pkgver=20260512
pkgrel=1
pkgdesc="s6-rc service scripts for atftp"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-atftp')
conflicts=('init-atftp')
depends=('atftp' 's6-base')
makedepends=('git')
backup=('etc/s6/config/atftp.conf')
_commit=6d6f6e34a4dbe6a18fe5889510d6956f8d6dffa0
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('ebece0d6c57ab07011e1e56dadbd29bc03cc1b52041f5f3042e5e3bb5d4cc31e')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "atftp" "${pkgdir}"
}
