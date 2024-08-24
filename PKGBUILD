# Maintainer: artist for Artix Linux

pkgname=ly-openrc
pkgver=20240824
pkgrel=2
pkgdesc="OpenRC ly init script"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('openrc-world')
provides=('init-displaymanager')
depends=('ly' 'openrc')
conflicts=('init-displaymanager')
source=("ly.initd")
sha256sums=('d5d6ed360a2af92dfd3431ae57cfd2746ac66c13b10bf02615e2df7dc902ca06')

package() {
    install -Dm755 "$srcdir/ly.initd" "$pkgdir/etc/init.d/ly"
}

