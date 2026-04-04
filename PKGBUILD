# Contributor: Carlos Eduardo <capezotte@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>

pkgname=zramen-dinit
pkgver=20260404
pkgrel=1
pkgdesc="dinit service scripts for zramen"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-galaxy')
depends=('zramen' 'dinit')
conflicts=('init-zramen')
provides=('init-zramen')
source=("zramen")
sha256sums=('61b035db4921b2a845bd49b667ac16a1cd69ba9e50a4c3ca6339058eaa8df66f')

package() {
    install -Dm644 zramen -t  "$pkgdir/etc/dinit.d"
}
