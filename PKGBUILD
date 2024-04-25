# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.4.2
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2 (forked from openrc)'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
provides=('cg-controller')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('bcbfdc5503a79685bb6809cd6941f7688cf403b83377ed0dc1f99ad192b4b4cc')

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
