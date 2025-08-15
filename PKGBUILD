# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=wireplumber-dinit
pkgver=20250815
pkgrel=1
pkgdesc="dinit user service script for wireplumber"
arch=('any')
url="https://artixlinux.org"
license=('BSD-2-Clause')
groups=('dinit-world')
depends=(
    'pipewire-dinit'
    'wireplumber'
)
source=(
    "wireplumber.user"
    LICENSE
)
sha256sums=('0bcb623d1282ea79b160f2a59900536698b191301a7980642f4f99b8c5470451'
            'a5a440e8b046dc1351b650eabb6e1947a4a2ad502780e1cf105916ed8aca48ff')

package() {
    install -Dm644 wireplumber.user   "$pkgdir/etc/dinit.d/user/wireplumber"

    install -Dm0644 -t "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE
}
