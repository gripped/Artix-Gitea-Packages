# Maintainer: artist for Artix Linux

pkgname=greetd-dinit
pkgver=20230923
pkgrel=3
pkgdesc="dinit service script for greetd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('greetd' 'dinit')
groups=('dinit-world')
provides=('init-greetd' 'init-displaymanager')
conflicts=('init-greetd' 'init-displaymanager')
source=("greetd")
sha256sums=('2eace7fbc4491b04192c49a0c6c7f881ef882b269590fa4543867914da77f35c')

package() {
    install -Dm644 greetd "$pkgdir/etc/dinit.d/greetd"
}

