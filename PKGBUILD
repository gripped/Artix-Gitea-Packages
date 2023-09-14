# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=unbound-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for unbound"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('unbound' 'dinit')
conflicts=('init-unbound')
provides=('init-unbound')
source=("unbound")
sha256sums=('067806fa592d24d083e56ab476fb6915c16c53732a00f786707ded0bf090665d')

package() {
    install -Dm644 unbound "$pkgdir/etc/dinit.d/unbound"
}
