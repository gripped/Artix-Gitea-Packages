# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fail2ban-dinit
pkgver=20240312
pkgrel=2
pkgdesc="dinit service scripts for fail2ban"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fail2ban' 'dinit')
conflicts=('init-fail2ban')
provides=('init-fail2ban')
source=("fail2ban")
sha256sums=('83699ea04a3549e315d7eba9861bb59d03e61b55001cf4dd59be0a3891e847b2')

package() {
    install -Dm644 fail2ban "$pkgdir/etc/dinit.d/fail2ban"
}
