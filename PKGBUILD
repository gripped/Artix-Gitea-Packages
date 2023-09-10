# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=cpupower-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for cpupower"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('cpupower' 'dinit')
conflicts=('init-cpupower')
provides=('init-cpupower')
source=("cpupower" "cpupower.script")
sha256sums=('fca4e09ddc6b35549ae906ab0b0e62ed357b7d044221262a23cb0c215f64a137'
            '9dc13d4b12eaa7605b80c28940489cce4a56e7b22e0c2d2ba3839361af4d8485')

package() {
    install -Dm644 cpupower        "$pkgdir/etc/dinit.d/cpupower"
    install -Dm755 cpupower.script "$pkgdir/etc/dinit.d/scripts/cpupower"
}
