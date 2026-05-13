# Contributor: Carlos Eduardo <capezotte@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>

pkgname=zramen-dinit
pkgver=20260512
pkgrel=1
pkgdesc="dinit service scripts for zramen"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-galaxy')
depends=('zramen' 'dinit')
conflicts=('init-zramen')
provides=('init-zramen')
backup=('etc/dinit.d/config/zramen.conf')
source=('zramen' 'zramen.conf')
sha256sums=('572f8a9d29168742b0003a4508ec6f4682a61406ea37b70c72c6e99a31d37466'
            '4cc81ffc75e4c065ac6718dce93547a515101564321990b4e25f3711b0e081e4')

package() {
    install -Dm644 zramen.conf "${pkgdir}/etc/dinit.d/config/zramen.conf"
    install -Dm644 zramen "${pkgdir}/etc/dinit.d/zramen"
}
