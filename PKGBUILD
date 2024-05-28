# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=wireplumber-dinit
pkgver=20240528
pkgrel=1
pkgdesc="dinit user service script for wireplumber"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('turnstile-experimental')
depends=('pipewire-dinit')
source=("wireplumber.user" "wireplumber.script")
sha256sums=('48fe1ed0987668aea867f6c10dd49fb84d85e4d51a60adde251211ac754495b2'
            '7ddda3022fdb624fad890ef3d3aa3bebf09b7d4678784a4fbdc024c31f72a1f2')

package() {
    install -Dm644 wireplumber.user   "$pkgdir/etc/dinit.d/user/wireplumber"
    install -Dm755 wireplumber.script "$pkgdir/usr/lib/dinit/user/wireplumber"
}
