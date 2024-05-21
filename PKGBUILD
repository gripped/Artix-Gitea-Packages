# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=spamassassin-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service script for spamassassin"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('spamassassin' 'dinit')
groups=('dinit-world')
conflicts=('init-spamassassin')
provides=('init-spamassassin')
source=("spamd")
sha256sums=('63de1a327b89322e0f2af7bbff685f2d65aa3ebdc264032e8cf824401d4c91b4')

package() {
    install -Dm644 spamd "$pkgdir/etc/dinit.d/spamd"
}
