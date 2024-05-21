# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=prosody-dinit
pkgver=20230915
pkgrel=2
pkgdesc="dinit service scripts for prosody"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('prosody' 'dinit')
provides=('init-prosody')
conflicts=('init-prosody')
source=("prosody" "prosody-pre")
sha256sums=('97b5a82692dcef89fd75c0feb3c84125652f6fd030e2b11ed3076c7f6cb5ce0b'
            '5d321816d00949c20da1f493cd9fc49806eed7eed8b0387e9bc2e0b305edc07e')

package() {
    install -Dm644 prosody     "$pkgdir/etc/dinit.d/prosody"
    install -Dm644 prosody-pre "$pkgdir/etc/dinit.d/prosody-pre"
}
