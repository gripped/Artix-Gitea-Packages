# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.4.1
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2 (forked from openrc)'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
provides=('cg-controller')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('5f05dfb87aa2c6b3812a048fb0f885597805d0f52cef11b4c134d37a67717f22')

prepare() {
    cd "${pkgname}"
    # patches here
}

pkgver() {
    cd "${pkgname}"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C "${pkgname}" PREFIX=/usr CGROUP="openrc"
}

package() {
    make -C "${pkgname}" PREFIX=/usr DESTDIR="${pkgdir}" install

    # license
    install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
