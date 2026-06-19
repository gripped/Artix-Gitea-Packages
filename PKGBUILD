# Maintainer: capezotte <capezotte@artixlinux.org>
# Script-by: keryhex <https://github.com/keryhex>

pkgname=tuned-dinit
pkgver=20260619
pkgrel=1
pkgdesc="dinit service scripts for tuned"
arch=('any')
url="https://auris.artixlinux.org"
license=('0BSD')
groups=('dinit-galaxy')
depends=('tuned' 'dinit')
conflicts=('init-tuned')
provides=('init-tuned')
source=('tuned')
sha256sums=('c903506fd838535116a544d7f6cb5c944edbb4c1123b3614f8a893d552794eb8')

package() {
    install -Dm644 tuned "$pkgdir/etc/dinit.d/tuned"
}
