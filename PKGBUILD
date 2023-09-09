# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=at-dinit
pkgver=20211101
pkgrel=2
pkgdesc="dinit service scripts for at"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('at' 'dinit')
makedepends=('git')
conflicts=('init-at')
provides=('init-at')
_commit=185c4b2e51cf46d99b474af9018c25039d7092a8
source=("atd"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('7e130ab3b0c08ef9182e7925a14f1d78b3ce45fcb06f12c584c57dee54a226ea'
            'SKIP')

package() {
    install -Dm644 atd "$pkgdir/etc/dinit.d/atd"

    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_at
}
