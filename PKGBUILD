# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=device-mapper-dinit
pkgver=20211029
pkgrel=4
pkgdesc="dinit service scripts for device-mapper"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('device-mapper' 'dinit')
provides=('init-device-mapper')
conflicts=('init-device-mapper')
source=("dmeventd")
sha256sums=('6ae71beb95d6705636fb9855d74259babbbb2fe6d3e135869d7bab255881c6e8')

package() {
    install -Dm644 dmeventd "$pkgdir/etc/dinit.d/dmeventd"
}
