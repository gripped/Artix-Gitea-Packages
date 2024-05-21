# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bftpd-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for bftpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bftpd' 'dinit')
conflicts=('init-bftpd')
provides=('init-bftpd')
source=("bftpd")
sha256sums=('eeba718a6e2595a3dd1997213f7a8e3e94342f2b88f23dac2137d63fb083279d')

package() {
    install -Dm644 bftpd "$pkgdir/etc/dinit.d/bftpd"
}
