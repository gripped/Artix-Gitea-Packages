# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=rspamd-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for rspamd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('rspamd' 'dinit')
conflicts=('init-rspamd')
provides=('init-rspamd')
source=("rspamd")
sha256sums=('daef5f49f6da579205397091bc53fbac161daa8837ee05d0fc3fa1f4e1bc4025')

package() {
    install -Dm644 rspamd "$pkgdir/etc/dinit.d/rspamd"
}
