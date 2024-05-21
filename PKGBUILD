# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cronie-dinit
pkgver=20211104
pkgrel=5
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
sha256sums=('de7ca7f410b60144e1f6cc415151a652ae21c77ffbc4cb9eacb8859218c5577e'
            'bc677499c47c3947411c19d963cf7dea58da5d30a2029d01f24d0496ea433978')

package() {
    install -Dm644 cronie "$pkgdir/etc/dinit.d/cronie"
    cd "$srcdir/alpm-hooks"
    make DESTDIR="$pkgdir" install_dinit_cronie
}
