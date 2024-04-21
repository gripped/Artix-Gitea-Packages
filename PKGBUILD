# Maintainer: artoo <artoo@artixlinux.org>

_branch=master

pkgname=artix-cgroups
pkgver=0.2
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2 (forked from openrc)'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('3b5e0d545955ab273178d03b4e0037c88ccc7fd271ea7c2bafb3be3e1dc388dc')

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
