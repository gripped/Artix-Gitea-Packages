# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=ejabberd-dinit
pkgver=20230912
pkgrel=2
pkgdesc="dinit service scripts for ejabberd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('ejabberd' 'dinit')
provides=('init-ejabberd')
conflicts=('init-ejabberd')
source=("ejabberd")
sha256sums=('6e0e495b294ba9519db0f50c1d7d3d1cabd69334cf8462898e5439edb9e11182')

package() {
    install -Dm644 ejabberd        "$pkgdir/etc/dinit.d/ejabberd"
}
