# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=gpm-dinit
pkgver=20211029
pkgrel=2
pkgdesc="dinit service scripts for gpm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('gpm' 'dinit')
conflicts=('init-gpm')
provides=('init-gpm')
source=("gpm")
sha256sums=('a5af25e71ad3493788cdf119cc89fb2fde5f218e1455fde26197b74b9e22cf96')

package() {
    install -Dm644 gpm "$pkgdir/etc/dinit.d/gpm"
}
