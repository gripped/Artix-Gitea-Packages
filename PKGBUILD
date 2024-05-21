# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apparmor-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service script for AppArmor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
provides=('init-apparmor')
conflicts=('init-apparmor')
depends=('apparmor' 'dinit')
source=('apparmor')
sha256sums=('59bfa18aaeb67c23decacd012be72a076a007421a61228d13e398833afead82a')

package() {
    install -Dm644 apparmor "${pkgdir}/etc/dinit.d/apparmor"
}
