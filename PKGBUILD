# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=intel-undervolt-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for intel-undervolt"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('intel-undervolt' 'dinit')
conflicts=('init-intel-undervolt')
provides=('init-intel-undervolt')
source=("intel-undervolt" "intel-undervolt-loop")
sha256sums=('93cab8d9322539968f856c0ff58f1223dd9f793237a4fdc55825dfae16686757'
            'bc585dc37f06c32013c5ef230094fd49adeb6b38a029646745c45dd306faf822')

package() {
    install -Dm644 intel-undervolt      "$pkgdir/etc/dinit.d/intel-undervolt"
    install -Dm644 intel-undervolt-loop "$pkgdir/etc/dinit.d/intel-undervolt-loop"
}
