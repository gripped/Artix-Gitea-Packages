# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=syslog-ng-dinit
pkgver=20211027
pkgrel=3
pkgdesc="dinit service scripts for syslog-ng"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('syslog-ng' 'dinit')
conflicts=('init-syslog-ng')
provides=('init-syslog-ng')
source=("syslog-ng")
sha256sums=('d6b7feb096be1874799dc75a19c3c7db8d8626f1bc7f47e6901e98f72c3de729')

package() {
    install -Dm644 syslog-ng "$pkgdir/etc/dinit.d/syslog-ng"
}
