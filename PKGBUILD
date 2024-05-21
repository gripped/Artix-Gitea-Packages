# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=ntp-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for ntp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ntp' 'dinit')
conflicts=('init-ntp' 'init-timed' 'openntpd-dinit')
provides=('init-ntp' 'init-timed')
source=("ntpd")
sha256sums=('990ded04e7116eef45da1e92016ca595cd7c041b372da7a9779ca96a4db0b7b6')

package() {
    install -Dm644 ntpd "$pkgdir/etc/dinit.d/ntpd"
}
