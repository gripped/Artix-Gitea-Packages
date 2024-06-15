# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=cpupower-dinit
pkgver=20240615
pkgrel=1
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
            'd3582c963a4be97c4bc3b8e05e20466def7f4bf63bb94b4f7a19032fc2dcf1bf')

package() {
    install -Dm644 cpupower        "$pkgdir/etc/dinit.d/cpupower"
    install -Dm755 cpupower.script "$pkgdir/usr/lib/dinit/cpupower"
}
