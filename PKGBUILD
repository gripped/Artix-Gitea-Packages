# Maintainer: artist for Artix Linux

pkgname=greetd-openrc
pkgver=20231222
pkgrel=1
pkgdesc="OpenRC greetd init script"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('openrc-world')
provides=('init-displaymanager')
depends=('greetd' 'openrc')
conflicts=('init-displaymanager')
source=("greetd.initd")
sha256sums=('3d2881bd0238fe4c56604644bae2f900977c99859cb54c85a252324e9749d9d8')

package() {
    install -Dm755 "$srcdir/greetd.initd" "$pkgdir/etc/init.d/greetd"
}
