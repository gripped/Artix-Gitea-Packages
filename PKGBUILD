# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=xdm-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for xdm (The original Xorg XDM)"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('xorg-xdm' 'dinit')
provides=('init-xdm' 'init-displaymanager')
conflicts=('init-xdm' 'init-displaymanager')
source=("xdm")
sha256sums=('22f0e79546fa8122a8e9ef72722218968ba8b6eb997a77196690564c216e65ad')

package() {
    install -Dm644 xdm "$pkgdir/etc/dinit.d/xdm"
}
