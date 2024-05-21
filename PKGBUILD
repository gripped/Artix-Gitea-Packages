# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=at-dinit
pkgver=20211101
pkgrel=3
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
sha256sums=('4a672eed5c0726d9d8df0381a00111cc95f10c49baeb0ca4949871d10a1e3fc7'
            'bc677499c47c3947411c19d963cf7dea58da5d30a2029d01f24d0496ea433978')

package() {
    install -Dm644 atd "$pkgdir/etc/dinit.d/atd"

    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_at
}
