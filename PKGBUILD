# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apparmor-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for AppArmor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
provides=('init-apparmor')
conflicts=('init-apparmor')
depends=('apparmor' 'dinit')
source=('apparmor')
sha256sums=('cea6d78a8ccee5cbfcbce5f649e5ba0da57517346d5fc6806970a7309a6755cb')

package() {
    install -Dm644 apparmor "${pkgdir}/etc/dinit.d/apparmor"
}
