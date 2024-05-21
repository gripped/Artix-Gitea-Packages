# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=mopidy-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for mopidy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('mopidy' 'dinit')
conflicts=('init-mopidy')
provides=('init-mopidy')
source=("mopidy")
sha256sums=('35d5ac601b709c82aeee966766ad2329f756045e914ac759613007cf27554168')

package() {
    install -Dm644 mopidy "$pkgdir/etc/dinit.d/mopidy"
}
