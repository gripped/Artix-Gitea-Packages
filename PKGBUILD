# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=device-mapper-dinit
pkgver=20211029
pkgrel=2
pkgdesc="dinit service scripts for device-mapper"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('device-mapper' 'dinit')
provides=('init-device-mapper')
conflicts=('init-device-mapper')
source=("dmeventd")
sha256sums=('ede555caf6329a86f2c7934930b5d87bcd3508f9596b6f43c66f0f557ac15f3e')

package() {
    install -Dm644 dmeventd "$pkgdir/etc/dinit.d/dmeventd"
}
