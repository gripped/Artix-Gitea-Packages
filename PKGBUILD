# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=spamassassin-dinit
pkgver=20211030
pkgrel=2
pkgdesc="dinit service script for spamassassin"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('spamassassin' 'dinit')
groups=('dinit-world')
conflicts=('init-spamassassin')
provides=('init-spamassassin')
source=("spamd")
sha256sums=('32154f54c4acc410bbc8f19261a89e52edbece65f9ae0034f32e726eecc4d871')

package() {
    install -Dm644 spamd "$pkgdir/etc/dinit.d/spamd"
}
