# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.4
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2 (forked from openrc)'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
provides=('cg-controller')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('644d5e0c9aeb430f4ca5a2159f78c5ddb1305cd8fe1dc63c51bed1672986b821')

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
