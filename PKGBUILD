# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=bumblebee-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for bumblebee"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bumblebee' 'dinit')
conflicts=('init-bumblebee')
provides=('init-bumblebee')
source=("bumblebeed")
sha256sums=('84a78ebb59ac609eaefcffedd9472c763cb8cdaf8042fc143feb8bdfff8e06c9')

package() {
    install -Dm644 bumblebeed "$pkgdir/etc/dinit.d/bumblebeed"
}
