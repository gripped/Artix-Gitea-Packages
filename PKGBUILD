# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=artix-artwork
pkgname=('artix-icons' 'artix-backgrounds')
pkgver=0.9
pkgrel=2
arch=('any')
url="https://gitea.artixlinux.org/artix/artwork"
license=('GPL')
source=("${pkgbase}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
groups=('artix-branding')
sha256sums=('4b3b61a10fbaf3e3e9bdaf61ede39fdad9da48c34d049b9d7d08a873ec51ad9c')

package_artix-backgrounds(){
    pkgdesc='Artix backgrounds'

    cd artwork #-${pkgver}
    make PREFIX=/usr DESTDIR=${pkgdir} install_backgrounds
}

package_artix-icons(){
    pkgdesc='Artix icons'

    cd artwork #-${pkgver}
    make PREFIX=/usr DESTDIR=${pkgdir} install_icons install_logo
}
