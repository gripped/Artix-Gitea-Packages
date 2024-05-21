# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=clamav-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for clamav"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('clamav' 'dinit')
conflicts=('init-clamav')
provides=('init-clamav')
source=("clamd" "clamd.script" "freshclam")
sha256sums=('ea1dcc02ea4bd0d13f64fb44c5647d25a51689b437df5da15567b5b11174a491'
            'd5a3e199debb287e24b4f6f829559a534b0b3c058b72fe5912acb2dc3f2dd47c'
            '9cb2f4df766a080673dfce91d3d2e11dae0192d1d4530cc899e14f5289b85f06')

package() {
    install -Dm644 clamd        "$pkgdir/etc/dinit.d/clamd"
    install -Dm755 clamd.script "$pkgdir/usr/lib/dinit/clamd"
    install -Dm644 freshclam    "$pkgdir/etc/dinit.d/freshclam"
}
