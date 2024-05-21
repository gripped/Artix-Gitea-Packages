# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=opensmtpd-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for opensmtpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('opensmtpd' 'dinit')
conflicts=('init-opensmtpd')
provides=('init-opensmtpd')
source=("smtpd")
sha256sums=('386d2f8a021d306f6c1797866b713d24f4155877206d624d49aa3a8c29d6d132')

package() {
    install -Dm644 smtpd "$pkgdir/etc/dinit.d/smtpd"
}
