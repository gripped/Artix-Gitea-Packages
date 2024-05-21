# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=nsd-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for nsd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('nsd' 'dinit')
conflicts=('init-nsd')
provides=('init-nsd')
source=("nsd" "nsd-pre")
sha256sums=('1536f9919e939123d88cd9153e79321f43eabc1614a2c5c0ecddfebdcab5d2a8'
            'a0aee81ab1de8b648a98ed0d854b800990e44393a10bf05e24e4b6aa898d581d')

package() {
    install -Dm644 nsd     "$pkgdir/etc/dinit.d/nsd"
    install -Dm644 nsd-pre "$pkgdir/etc/dinit.d/nsd-pre"
}
