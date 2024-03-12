# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=fail2ban-dinit
pkgver=20240312
pkgrel=1
pkgdesc="dinit service scripts for fail2ban"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('fail2ban' 'dinit')
conflicts=('init-fail2ban')
provides=('init-fail2ban')
source=("fail2ban")
sha256sums=('5a5564fa254981222436a5a34cc97a9280ee1040bbc0149e5929656a40a65287')

package() {
    install -Dm644 fail2ban "$pkgdir/etc/dinit.d/fail2ban"
}
