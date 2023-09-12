# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fwknop-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for fwknop"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fwknop' 'dinit')
conflicts=('init-fwknop')
provides=('init-fwknop')
source=("fwknopd")
sha256sums=('1c3f04a22c9159c2a8bd4a6e3c6edd31be5e3aec6aa44429119ddfae061d97da')

package() {
    install -Dm644 fwknopd "$pkgdir/etc/dinit.d/fwknopd"
}
