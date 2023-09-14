# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sndio-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for sndio"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sndio' 'dinit')
conflicts=('init-sndio')
provides=('init-sndio')
source=("sndiod")
sha256sums=('c1d2294f0b94c8fda5392dd858ed183efc6a0b5961de3e5ce50e20dcf1855db8')

package() {
    install -Dm644 sndiod "$pkgdir/etc/dinit.d/sndiod"
}
