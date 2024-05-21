# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=toxcore-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for toxcore"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('toxcore' 'dinit')
conflicts=('init-toxcore')
provides=('init-toxcore')
source=("toxbootstrapd")
sha256sums=('e0d611f7bd1be0da1ae68080661492790a62f24ffd21d64a243e659e5fff9747')

package() {
    install -Dm644 toxbootstrapd "$pkgdir/etc/dinit.d/toxbootstrapd"
}
