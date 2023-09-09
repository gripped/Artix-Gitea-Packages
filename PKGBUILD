# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bftpd-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for bftpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bftpd' 'dinit')
conflicts=('init-bftpd')
provides=('init-bftpd')
source=("bftpd")
sha256sums=('c60739139c79048e3635b2d3c1ffa4d86b02ab8bf6a181874e97c1a1a7d672dd')

package() {
    install -Dm644 bftpd "$pkgdir/etc/dinit.d/bftpd"
}
