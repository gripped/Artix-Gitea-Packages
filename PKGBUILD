# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=lxdm-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for lxdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-galaxy')
depends=('lxdm' 'dinit')
conflicts=('init-lxdm')
provides=('init-lxdm')
source=("lxdm")
sha256sums=('065329c75915e5adfc6276d524762570b3af31f34bbf57c863a2517acac51346')

package() {
    install -Dm644 lxdm "$pkgdir/etc/dinit.d/lxdm"
}
