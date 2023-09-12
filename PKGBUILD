# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=gitea-dinit
pkgver=20211101
pkgrel=3
pkgdesc="dinit service scripts for gitea"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('gitea' 'dinit')
conflicts=('init-gitea')
provides=('init-gitea')
source=("gitea")
sha256sums=('d8ee71fbc0daecb470ca2f3fe38c4a663793f0655a1df441e88be92b1dbabfd5')

package() {
    install -Dm644 gitea "$pkgdir/etc/dinit.d/gitea"
}
