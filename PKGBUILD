# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=lxdm-dinit
pkgver=20211102
pkgrel=5
pkgdesc="dinit service scripts for lxdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lxdm' 'dinit')
conflicts=('init-lxdm')
provides=('init-lxdm')
source=("lxdm")
sha256sums=('bb59ae41481ecd8eca9ad1dc7d0be10e76ddd0919fa8c85ea7d0820500716b1e')

package() {
    install -Dm644 lxdm "$pkgdir/etc/dinit.d/lxdm"
}
