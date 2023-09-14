# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=xdm-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for xdm (The original Xorg XDM)"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xorg-xdm' 'dinit')
provides=('init-xdm' 'init-displaymanager')
conflicts=('init-xdm' 'init-displaymanager')
source=("xdm")
sha256sums=('a487666be65ffff70c1c8d99afcaf1184271a08b3059500c0b734427ffdfa7be')

package() {
    install -Dm644 xdm "$pkgdir/etc/dinit.d/xdm"
}
