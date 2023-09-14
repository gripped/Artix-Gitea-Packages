# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=subversion-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for subversion"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('subversion' 'dinit')
conflicts=('init-subversion')
provides=('init-subversion')
source=("svnserve")
sha256sums=('9e84aceae45d794bc8034a99b5684d0e0dd56d97a53ff9f866a1a154d4479f50')

package() {
    install -Dm644 svnserve "$pkgdir/etc/dinit.d/svnserve"
}
