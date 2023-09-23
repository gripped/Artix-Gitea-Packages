# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=earlyoom-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for earlyoom"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-galaxy')
depends=('earlyoom' 'dinit')
conflicts=('init-earlyoom')
provides=('init-earlyoom')
backup=('etc/dinit.d/config/earlyoom.conf')
source=("earlyoom" "earlyoom.conf" "earlyoom.script")
sha256sums=('0f82f926b361c18efa7a0f544c07b3be45d8c1648bb5e9e65988e57726410495'
            '22ea5061edb9298c57a8a34dec48bcc30ee37b2603c45a10da97c3364b8f753b'
            '72ca205e3313211a09848c6f51a42e0c7dab8b146c40e184070cf739f62dbe71')

package() {
    install -Dm644 earlyoom        "$pkgdir/etc/dinit.d/earlyoom"
    install -Dm644 earlyoom.conf   "$pkgdir/etc/dinit.d/config/earlyoom.conf"
    install -Dm755 earlyoom.script "$pkgdir/usr/lib/dinit/earlyoom"
}
