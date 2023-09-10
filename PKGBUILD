# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cronie-dinit
pkgver=20211104
pkgrel=4
pkgdesc="dinit service scripts for cronie"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('cronie' 'dinit')
makedepends=('git')
provides=('init-cronie' 'init-cron')
conflicts=('init-cronie' 'init-cron')
_commit=185c4b2e51cf46d99b474af9018c25039d7092a8
source=("cronie"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit")
sha256sums=('02b80e2118eeec1e72084d1666c5ff07ef878b4516a4d6d000c50a45aedb772c'
            'SKIP')

package() {
    install -Dm644 cronie "$pkgdir/etc/dinit.d/cronie"
    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_cronie
}
