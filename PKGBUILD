# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=rspamd-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for rspamd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rspamd' 'dinit')
conflicts=('init-rspamd')
provides=('init-rspamd')
source=("rspamd")
sha256sums=('a8f9acf4f8e0c2680de6e211c01c555cae87fd5af2b0507a3a76ea0c8eae458a')

package() {
    install -Dm644 rspamd "$pkgdir/etc/dinit.d/rspamd"
}
