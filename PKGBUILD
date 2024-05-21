# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=gitea-dinit
pkgver=20211101
pkgrel=4
pkgdesc="dinit service scripts for gitea"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('gitea' 'dinit')
conflicts=('init-gitea')
provides=('init-gitea')
source=("gitea")
sha256sums=('54573344bd80138b6334e16582bd3db266c65c088ea0c1bf45dacba55584d4ce')

package() {
    install -Dm644 gitea "$pkgdir/etc/dinit.d/gitea"
}
