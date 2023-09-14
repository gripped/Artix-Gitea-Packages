# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=rsync-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for rsync"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rsync' 'dinit')
conflicts=('init-rsync')
provides=('init-rsync')
source=("rsync")
sha256sums=('44393333b1c67592c2eb8c9f788ec257f171b11170dcef795318261a76cf74e4')

package() {
    install -Dm644 rsync "$pkgdir/etc/dinit.d/rsync"
}
