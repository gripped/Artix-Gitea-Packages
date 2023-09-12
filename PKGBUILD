# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=opensips-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for opensips"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('opensips' 'dinit')
conflicts=('init-opensips')
provides=('init-opensips')
source=("opensips")
sha256sums=('a1afcc2193df1e8fe6487aa0a669963c70f157a2d4a08428271d78ddb0586c63')

package() {
    install -Dm644 opensips "$pkgdir/etc/dinit.d/opensips"
}
