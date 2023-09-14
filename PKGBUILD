# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=vsftpd-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for vsftpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('vsftpd' 'dinit')
conflicts=('init-vsftpd')
provides=('init-vsftpd')
source=("vsftpd" "vsftpd-ipv6")
sha256sums=('a3c787d8434b63fc5215cb9e24d70402e36daebf8e7b3a1c855b2e7bf9946daf'
            '703984237c4dbbdfa402b95ff37f2e6423a9c34387e66b61023cd74c7abf09a7')

package() {
    install -Dm644 vsftpd      "$pkgdir/etc/dinit.d/vsftpd"
    install -Dm644 vsftpd-ipv6 "$pkgdir/etc/dinit.d/vsftpd-ipv6"
}
