# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=atftp-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for atftp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('atftp' 'dinit')
conflicts=('init-atftp')
provides=('init-atftp')
source=("atftpd")
sha256sums=('6c1d2fc1f177376c7996ad15bc344221485326dc9180dd801e6a91ce83f9817c')

package() {
    install -Dm644 atftpd "$pkgdir/etc/dinit.d/atftpd"
}
