# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=opensmtpd-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for opensmtpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('opensmtpd' 'dinit')
conflicts=('init-opensmtpd')
provides=('init-opensmtpd')
source=("smtpd")
sha256sums=('c4c0396e267d8dad7efeda1a00cdb42e09c2e6f1c670475c410d0e44a3edebf7')

package() {
    install -Dm644 smtpd "$pkgdir/etc/dinit.d/smtpd"
}
