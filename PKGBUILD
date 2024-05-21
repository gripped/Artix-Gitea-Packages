# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=gpm-dinit
pkgver=20211029
pkgrel=3
pkgdesc="dinit service scripts for gpm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('gpm' 'dinit')
conflicts=('init-gpm')
provides=('init-gpm')
source=("gpm")
sha256sums=('896ad0007cfb6f10797a6d46c5be11ed9b96b285d0662cddb66b1f007cf30300')

package() {
    install -Dm644 gpm "$pkgdir/etc/dinit.d/gpm"
}
