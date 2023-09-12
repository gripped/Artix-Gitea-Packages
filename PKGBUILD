# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=ntp-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for ntp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ntp' 'dinit')
conflicts=('init-ntp' 'init-timed' 'openntpd-dinit')
provides=('init-ntp' 'init-timed')
source=("ntpd")
sha256sums=('499fd6573ba3e6cc601cc625d7b787a261386f907e64dd2b01dd5a381790f8d2')

package() {
    install -Dm644 ntpd "$pkgdir/etc/dinit.d/ntpd"
}
