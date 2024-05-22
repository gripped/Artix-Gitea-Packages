# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=mdadm-dinit
pkgver=20240522
pkgrel=2
pkgdesc="dinit startup scripts for mdadm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('mdadm' 'dinit-rc')
provides=('init-mdadm')
conflicts=('init-mdadm')
source=("mdadm")
sha256sums=('0234fd7b838898cc152c0a6bf8a365734c3bcda773c432e60958a0cb90135548')

package() {
    install -Dm644 mdadm "$pkgdir/etc/dinit.d/mdadm"
}
