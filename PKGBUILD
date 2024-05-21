# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=cpupower-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for cpupower"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('cpupower' 'dinit')
conflicts=('init-cpupower')
provides=('init-cpupower')
source=("cpupower" "cpupower.script")
sha256sums=('6548864d486ed7fd4cc50c0be973dc7ec302ae225f63a6b02dbf610b19d37dbb'
            '9dc13d4b12eaa7605b80c28940489cce4a56e7b22e0c2d2ba3839361af4d8485')

package() {
    install -Dm644 cpupower        "$pkgdir/etc/dinit.d/cpupower"
    install -Dm755 cpupower.script "$pkgdir/usr/lib/dinit/cpupower"
}
