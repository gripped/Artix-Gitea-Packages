# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=chrony-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for chrony"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('chrony' 'dinit')
conflicts=('init-chrony')
provides=('init-chrony')
source=("chronyd")
sha256sums=('400552538b7a1e788ce46e762df0391291577b47d89d7a1721e30d6e12183c36')

package() {
    install -Dm644 chronyd "$pkgdir/etc/dinit.d/chronyd"
}
