# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=device-mapper-dinit
pkgver=20211029
pkgrel=3
pkgdesc="dinit service scripts for device-mapper"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('device-mapper' 'dinit')
provides=('init-device-mapper')
conflicts=('init-device-mapper')
source=("dmeventd")
sha256sums=('45382264f797486453a6abb0e9c01c40c516759f4ebb07fea2ac684d32e13a28')

package() {
    install -Dm644 dmeventd "$pkgdir/etc/dinit.d/dmeventd"
}
