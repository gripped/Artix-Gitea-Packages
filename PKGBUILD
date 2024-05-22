# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mdadm-dinit
pkgver=20240522
pkgrel=1
pkgdesc="dinit startup scripts for mdadm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('mdadm' 'dinit-rc')
provides=('init-mdadm')
conflicts=('init-mdadm')
source=("mdadm")
sha256sums=('67c25a8d5029a1cca1a1afca5353f6d3ca9672821ff6674c1fa6bf4d5645cef9')

package() {
    install -Dm644 mdadm "$pkgdir/etc/dinit.d/mdadm"
}
