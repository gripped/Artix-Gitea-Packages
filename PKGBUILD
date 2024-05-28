# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=wireplumber-dinit
pkgver=20240528
pkgrel=2
pkgdesc="dinit user service script for wireplumber"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('turnstile-experimental')
depends=('pipewire-dinit')
source=("wireplumber.user")
sha256sums=('0bcb623d1282ea79b160f2a59900536698b191301a7980642f4f99b8c5470451')

package() {
    install -Dm644 wireplumber.user   "$pkgdir/etc/dinit.d/user/wireplumber"
}
