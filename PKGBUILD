# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=mopidy-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for mopidy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('mopidy' 'dinit')
conflicts=('init-mopidy')
provides=('init-mopidy')
source=("mopidy")
sha256sums=('dc6bec2ed1e229ef5df214ebbe9faaa22fc6a4a254c95037bd4bc9ec192f4ec3')

package() {
    install -Dm644 mopidy "$pkgdir/etc/dinit.d/mopidy"
}
