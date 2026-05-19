# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=s6-contrib
pkgver=1.1
pkgrel=1
pkgdesc='A collection of s6 convenience scripts.'
arch=('any')
url='https://gitea.artixlinux.org/artix/s6-contrib'
license=('GPL')
depends=('sh' 's6' 's6-scripts')
makedepends=('git')
backup=('etc/s6/s6-db-reload.conf')
_commit=f437f24ad603d2489bd68f3ef39d58d423c022ba # git rev-parse $pkgver
source=("git+$url.git#commit=$_commit")
sha256sums=('93cd6943eaf3415872c9f9452921686776f92750346826fe5cc0e8179b3771ca')

build() {
    make -C "${pkgname}"
}

package() {
    make -C "${pkgname}" install DESTDIR="${pkgdir}"
}
