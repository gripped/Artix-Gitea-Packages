# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=sane-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for sane"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sane' 'dinit')
conflicts=('init-sane')
provides=('init-sane')
source=("saned")
sha256sums=('62c08f8e010ac17e9f99ba634d7172bc7a252d6410387a3033fdf8702e2edeec')

package() {
    install -Dm644 saned "$pkgdir/etc/dinit.d/saned"
}
