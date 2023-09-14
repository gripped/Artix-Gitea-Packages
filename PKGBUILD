# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=syslog-ng-dinit
pkgver=20211027
pkgrel=2
pkgdesc="dinit service scripts for syslog-ng"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('syslog-ng' 'dinit')
conflicts=('init-syslog-ng')
provides=('init-syslog-ng')
source=("syslog-ng")
sha256sums=('0a4e4452df8ad533dc417fc7a5a22d7a5edda29de8a0ab42452dc1c4ec18cdc7')

package() {
    install -Dm644 syslog-ng "$pkgdir/etc/dinit.d/syslog-ng"
}
