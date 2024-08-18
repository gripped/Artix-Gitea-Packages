# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgbase=sddm-theme
pkgname=${pkgbase}-artix
pkgver=20240803
pkgrel=2
pkgdesc="Artix theme for SDDM"
arch=('any')
url="https://gitea.artixlinux.org/artix/sddm-theme-artix"
license=('GPL')
makedepends=('git')
depends=('sddm' 'qt5-declarative' 'artix-backgrounds')
conflicts=('artix-sddm-theme')
replaces=('artix-sddm-theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e936a35da63dbd1b75e6954648aa25f087ed56a3be939a1a0a3c2bcd5be03562')

package() {
    cd ${pkgname} #-${pkgver}
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
