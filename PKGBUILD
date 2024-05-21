# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=spotifyd-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for spotifyd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('spotifyd' 'dinit')
conflicts=('init-spotifyd')
provides=('init-spotifyd')
source=("spotifyd")
sha256sums=('97ca33c1247c6f4960746b6b4199660901ab4ec1ff006a0d695aa64ef39a26c7')

package() {
    install -Dm644 spotifyd "$pkgdir/etc/dinit.d/spotifyd"
}
