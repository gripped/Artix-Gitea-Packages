# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=at-s6
pkgver=20260512
pkgrel=1
pkgdesc="s6-rc service scripts for at"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-at')
conflicts=('init-at')
depends=('at' 's6-base')
makedepends=('git')
backup=('etc/s6/config/at.conf')
_hook_commit=0bb100c62bbde2878a242cc72626d00462c921b5
_commit=6d6f6e34a4dbe6a18fe5889510d6956f8d6dffa0
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_hook_commit")
sha256sums=('ebece0d6c57ab07011e1e56dadbd29bc03cc1b52041f5f3042e5e3bb5d4cc31e'
            '08abfdc151a7d4c2168b6452384ea93bc7b70a2f8c3b05ca7f910355b10f87df')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "at" "${pkgdir}"

    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_s6_at
}
