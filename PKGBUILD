# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=atftp-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for atftp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('atftp' 'dinit')
conflicts=('init-atftp')
provides=('init-atftp')
source=("atftpd")
sha256sums=('f8444382fc2acbcc3f19222970ea7bf1fa4b41a87e264bc2faf607d32294688c')

package() {
    install -Dm644 atftpd "$pkgdir/etc/dinit.d/atftpd"
}
