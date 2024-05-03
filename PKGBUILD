# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.7
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
sha256sums=('b59867753112c77254da60668eb6dd5c1453d1f4d0821b193fc12ac490bdc4c6')

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
