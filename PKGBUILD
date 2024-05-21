# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=brltty-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for brltty"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('brltty' 'dinit')
provides=('init-brltty')
conflicts=('init-brltty')
source=("brltty" "brltty-pre")
sha256sums=('148bf30c0be34e3a7a97915058870ce07b15335d19d7eb9be4a150f67d7dea29'
            'b33df6d45d5e6a9996375ae9a83073e08dfffc3240aab12848a50f0db6b7a6b1')

package() {
    install -Dm644 brltty     "$pkgdir/etc/dinit.d/brltty"
    install -Dm755 brltty-pre "$pkgdir/etc/dinit.d/brltty-pre"
}
