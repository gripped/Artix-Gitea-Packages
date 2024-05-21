# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=bind-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for bind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('bind' 'dinit')
provides=('init-bind')
conflicts=('init-bind')
source=("named" "named-pre")
sha256sums=('2bdacc412f700cd59ed4a79df9e0739ff0e4fd459147d5872a6a0236b11066d4'
            '27aa28ae41082268b651a156f54186339a0fbf8654e6c1fd307304483144e1c0')

package() {
    install -Dm644 named     "$pkgdir/etc/dinit.d/named"
    install -Dm644 named-pre "$pkgdir/etc/dinit.d/named-pre"
}
