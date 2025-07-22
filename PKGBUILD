# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=chrony-dinit
pkgver=20250722
pkgrel=1
pkgdesc="dinit service scripts for chrony"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('chrony' 'dinit')
conflicts=('init-chrony')
provides=('init-chrony')
source=("chronyd" "chrony" "chronyd.script")
sha256sums=('c5e4e7493d1af7a0366fb466f387c8fcaf84b14faccd3766e3de2eb5c4c7eefc'
            'de6ad518bac7c6f8424e4df55ccbe862677f6252718ac877f2f4dc86b584b27a'
            'ba21a44acc82fce706e8753310f20fa85061b0f126d4e765bbd220d35bf7c00c')

package() {
    install -Dm644 chronyd "$pkgdir/etc/dinit.d/chronyd"
    install -Dm644 chrony "$pkgdir/etc/dinit.d/chrony"
    install -Dm755 chronyd.script "$pkgdir/usr/lib/dinit/chronyd"
}
