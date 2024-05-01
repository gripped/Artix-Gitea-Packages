# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.6
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
sha256sums=('8a3b476a877636d7e0f3f48a880f2389e9b10a8effe42ec250966a069f9175db')

prepare() {
    cd "${pkgname}"
    # patches here
}

build() {
    make -C "${pkgname}" PREFIX=/usr CGROUP="openrc"
}

package() {
    make -C "${pkgname}" PREFIX=/usr DESTDIR="${pkgdir}" install

    # license
    install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
