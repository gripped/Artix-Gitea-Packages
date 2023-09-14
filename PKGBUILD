# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tinydns-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for tinydns"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tinydns' 'dinit')
conflicts=('init-tinydns')
provides=('init-tinydns')
source=("tinydns")
sha256sums=('2245323b5a93cb6856af0e890038fe1f0578b3c3742acaab2b3f3f58ba04bb07')

package() {
    install -Dm644 tinydns "$pkgdir/etc/dinit.d/tinydns"
}
