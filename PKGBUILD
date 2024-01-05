# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=s6-contrib
pkgver=1.0
pkgrel=2
pkgdesc='A collection of s6 convenience scripts.'
arch=('any')
url='https://gitea.artixlinux.org/artix/s6-contrib'
license=('GPL')
depends=('sh' 's6' 's6-scripts')
makedepends=('git')
backup=('etc/s6/s6-db-reload.conf')
_commit=7b2103447ed89aa0661d8800f8d9e061cf8bd63c # git rev-parse $pkgver
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    make -C "${pkgname}"
}

package() {
    make -C "${pkgname}" install DESTDIR="${pkgdir}"
}
