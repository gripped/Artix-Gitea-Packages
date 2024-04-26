# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.5
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
sha256sums=('6e1c372eda50da95ce5f919cb37071b2b4351470f896165bcaab5c47fca2cf45')

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
