# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=wireplumber-dinit
pkgver=20230929
pkgrel=2
pkgdesc="dinit user service script for wireplumber"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('turnstile-experimental')
depends=('pipewire-dinit')
source=("wireplumber.user")
sha256sums=('5cba541ab27b66d1476cdba22fdd7ba7e2aa31a26f45814a3f4d712033da9887')

package() {
    install -Dm644 wireplumber.user "$pkgdir/etc/dinit.d/user/wireplumber"
}
