# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=v2ray-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for v2ray"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('v2ray' 'dinit')
conflicts=('init-v2ray')
provides=('init-v2ray')
source=("v2ray")
sha256sums=('ed25ce280b27ce955cc5fb17c322a2a1d8389dc6cc38e1e44af23a9bf082c9ef')

package() {
    install -Dm644 v2ray "$pkgdir/etc/dinit.d/v2ray"
}
