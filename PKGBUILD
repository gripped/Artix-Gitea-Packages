# Maintainer: artist for Artix Linux

pkgname=greetd-dinit
pkgver=20230923
pkgrel=2
pkgdesc="dinit service script for greetd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('greetd' 'dinit')
groups=('dinit-world')
provides=('init-greetd' 'init-displaymanager')
conflicts=('init-greetd' 'init-displaymanager')
source=("greetd")
sha256sums=('65ffc65bfb989f2e4a23edabcd1424c94685cd504a252a06085db7d8b60265dd')

package() {
    install -Dm644 greetd "$pkgdir/etc/dinit.d/greetd"
}

