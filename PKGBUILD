# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=avahi-dinit
pkgver=20211026
pkgrel=2
pkgdesc="dinit service scripts for avahi"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('avahi' 'init-dbus')
groups=('dinit-world')
provides=('init-avahi')
conflicts=('init-avahi')
source=("avahi-daemon")
sha256sums=('e8156d88c499130957d216e67ed9f547b55884699b7e0b57a7e1125a1ffb9adf')

package() {
    install -Dm644 avahi-daemon "$pkgdir/etc/dinit.d/avahi-daemon"
}
