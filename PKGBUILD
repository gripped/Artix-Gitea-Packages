# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=firewalld-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for firewalld"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('firewalld' 'dinit' 'dbus-dinit')
conflicts=('init-firewalld')
provides=('init-firewalld')
source=("firewalld")
sha256sums=('6643198aca59587c8f6e8cd35ea4f6ae4b5cbda02daa33211895fc8d2cf7cff8')

package() {
    install -Dm644 firewalld "$pkgdir/etc/dinit.d/firewalld"
}
