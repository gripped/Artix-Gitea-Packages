# Maintainer: artoo <artoo@artixlinux.org>

_branch=master

pkgname=artix-cgroups
pkgver=0.1
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2 (forked from openrc)'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('4282aaf3ab7621202d485f39f88bbf117c234a2cef950c63d663157a174f2fb6')

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
