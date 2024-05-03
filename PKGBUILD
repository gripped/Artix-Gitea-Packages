# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.7.1
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
provides=('cg-controller')
backup=(
    'etc/artix/cgroups.conf'
)
source=("git+$url.git#tag=${pkgver}")
sha256sums=('6c0b45a033f575189f3459179f42754af4c65478d1d677f61a9ceaa9f972570a')

prepare() {
    cd "${pkgname}"
    # patches here
}

build() {
    make -C "${pkgname}" PREFIX=/usr CGROUP="artix"
}

package() {
    make -C "${pkgname}" PREFIX=/usr DESTDIR="${pkgdir}" install

    # license
    install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
