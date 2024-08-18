# Maintainer: artist for Artix Linux

pkgname=ly-dinit
pkgver=20240818
pkgrel=1
pkgdesc="dinit service script for ly"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('ly' 'dinit')
groups=('dinit-world')
provides=('init-ly' 'init-displaymanager')
conflicts=('init-ly' 'init-displaymanager')
source=("ly")
sha256sums=('7454c14f8a3ca4b67e030c29c59e9b32b2ab564f4aa4d17a0e5812a7f8a6dade')

package() {
    install -Dm644 ly "$pkgdir/etc/dinit.d/ly"
}

