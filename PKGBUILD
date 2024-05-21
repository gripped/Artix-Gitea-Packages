# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=chrony-dinit
pkgver=20240520
pkgrel=1
pkgdesc="dinit service scripts for chrony"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('chrony' 'dinit')
conflicts=('init-chrony')
provides=('init-chrony')
source=("chronyd" "chrony")
sha256sums=('3bb2f35a9b24a62014700c6ee39d18f65c190b1b25601cded24375042a2c2c10'
            'de6ad518bac7c6f8424e4df55ccbe862677f6252718ac877f2f4dc86b584b27a')

package() {
    install -Dm644 chronyd "$pkgdir/etc/dinit.d/chronyd"
    install -Dm644 chrony "$pkgdir/etc/dinit.d/chrony"
}
