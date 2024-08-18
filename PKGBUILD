# Maintainer: artist for Artix Linux

pkgname=ly-openrc
pkgver=20240818
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
sha256sums=('605b74e3306e9c231584fab408f75c0bb89ba70e4299b2738e26ebd8fb2d9a06')

package() {
    install -Dm755 "$srcdir/ly.initd" "$pkgdir/etc/init.d/ly"
}

