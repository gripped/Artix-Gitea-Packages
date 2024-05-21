# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=subversion-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for subversion"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('subversion' 'dinit')
conflicts=('init-subversion')
provides=('init-subversion')
source=("svnserve")
sha256sums=('34570c88f15120becb509d0178f33276e7f52cb01518300e6610930329d1d7cb')

package() {
    install -Dm644 svnserve "$pkgdir/etc/dinit.d/svnserve"
}
