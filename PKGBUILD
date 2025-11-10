# Maintainer: artoo <artoo@artixlinux.org>
#https://gitea.artixlinux.org/artix/iso-initcpio.git

pkgname=iso-initcpio
pkgver=4.1
pkgrel=1
arch=('any')
pkgdesc='Development tools for Artix (ISO initcpio)'
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-initcpio'
depends=('mkinitcpio')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('1b6f268c324e3aa63def466b9415e23b9bd9c187cb00f65cf71be318df962b25')

prepare() {
    cd ${pkgname}
}

package() {
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
