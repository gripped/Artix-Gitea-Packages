# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=fuse-dinit
pkgver=20211030
pkgrel=2
pkgdesc="dinit service scripts for fuse"
arch=('any')
url="https://artixlinux.org"
groups=('dinit-world')
provides=('init-fuse')
conflicts=('init-fuse')
depends=('fuse' 'dinit')
source=("fuse" "fuse.script")
sha256sums=('38dd16ebb8db36e7ec5aad483171891a00b657548279dd9965c6224c6e0d319b'
            '8501b8ebac992a3fc0abba63c73b1d7f003d451cc1190fea10a9eb0b4a8a4da6')

package() {
    install -Dm644 fuse        "$pkgdir/etc/dinit.d/fuse"
    install -Dm755 fuse.script "$pkgdir/usr/lib/dinit/fuse"
}
