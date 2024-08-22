# Maintainer: artist for Artix Linux

pkgname=ly-openrc
pkgver=20240824
pkgrel=1
pkgdesc="OpenRC ly init script"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('openrc-world')
provides=('init-displaymanager')
depends=('ly' 'openrc')
conflicts=('init-displaymanager')
source=("ly.initd")
sha256sums=('9bf866821ceba18bb27690e445733f6cb1bd18fc8ccdf014dba03c91c29c94ae')

package() {
    install -Dm755 "$srcdir/ly.initd" "$pkgdir/etc/init.d/ly"
}

