# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgbase=sddm-theme
pkgname=${pkgbase}-artix
pkgver=0.7
pkgrel=2
pkgdesc="Artix theme for SDDM"
arch=('any')
url="https://gitea.artixlinux.org/artix/sddm-theme-artix"
license=('GPL')
makedepends=('git')
depends=('sddm' "artix-backgrounds")
conflicts=('artix-sddm-theme')
replaces=('artix-sddm-theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7941c0e040a61b74fb71acef30d1c2dca85f41ff9bc22d1d7695b0481c025380')

package() {
    cd ${pkgname} #-${pkgver}
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
