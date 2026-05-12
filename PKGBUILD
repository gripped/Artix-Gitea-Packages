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
_commit=22903adc87ffdd4774cc30c5da4b09889339670b
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_hook_commit")
sha256sums=('7ed937d8bb15ab5d229d1843df54cd491156f0635f8299e6dba5f983abcb70c2'
            '08abfdc151a7d4c2168b6452384ea93bc7b70a2f8c3b05ca7f910355b10f87df')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "at" "${pkgdir}"

    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_s6_at
}
