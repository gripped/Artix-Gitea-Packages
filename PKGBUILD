# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dovecot-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service scripts for dovecot"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dovecot' 'dinit')
conflicts=('init-dovecot')
provides=('init-dovecot')
source=("dovecot" "dovecot-pre")
sha256sums=('2c08584a6013db599021ff2a0b1512137241f66ef820f39ea8bcbc4571192089'
            '90aaf32d976cd2119d9955104efa50604baea8853845a3f1f4e685b368c9e5e2')

package() {
    install -Dm644 dovecot     "$pkgdir/etc/dinit.d/dovecot"
    install -Dm644 dovecot-pre "$pkgdir/etc/dinit.d/dovecot-pre"
}
