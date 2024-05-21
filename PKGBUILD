# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=fuse-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for fuse"
arch=('any')
url="https://artixlinux.org"
groups=('dinit-world')
provides=('init-fuse')
conflicts=('init-fuse')
depends=('fuse' 'dinit')
source=("fuse" "fuse.script")
sha256sums=('e16d79dd565979fcd3e9153604d5276780e3dd92491768b8c2bc7e8ff74097ae'
            '8501b8ebac992a3fc0abba63c73b1d7f003d451cc1190fea10a9eb0b4a8a4da6')

package() {
    install -Dm644 fuse        "$pkgdir/etc/dinit.d/fuse"
    install -Dm755 fuse.script "$pkgdir/usr/lib/dinit/fuse"
}
