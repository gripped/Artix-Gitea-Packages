# Contributor: capezotte
# Contributor: ndowens
# Contributor: nous

pkgbase=zramen
pkgname=(zramen zramen-runit)
pkgdesc="Manage zram swap space"
pkgver=1.0.1
pkgrel=1
arch=('any')
url="https://github.com/atweiden/zramen"
license=('Unlicense')
depends=(bash)
source=("$url/releases/download/${pkgver}/zramen-${pkgver}.tar.gz")
sha256sums=('01e7d90891151e08dc3a6630c15da5795d4ed7a7ebabfbb585ecfe6defa8130d')

package_zramen() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 -t "$pkgdir/usr/bin/" -- zramen
}

package_zramen-runit() {
    depends+=(zramen runit)
    backup=(etc/runit/sv/zramen/conf)
    cd "${srcdir}/${pkgbase}-${pkgver}"
    mkdir -p -- "$pkgdir/etc/runit/"
    cp -a -- sv "$pkgdir/etc/runit"
}

# vim: sw=4 et
