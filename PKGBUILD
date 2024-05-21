# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postfix-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for postfix"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('postfix' 'dinit')
provides=('init-postfix')
conflicts=('init-postfix')
source=("postfix" "postfix-pre")
sha256sums=('625865f405afe7d9f44613650c771a549a9a76cd83ae93f7d434c172d7f4f3f6'
            '656af403d6d27a423a776b2cee4cf75c829b528c81a650f5cc8cb8552ff1c29d')

package() {
    install -Dm644 postfix     "$pkgdir/etc/dinit.d/postfix"
    install -Dm644 postfix-pre "$pkgdir/etc/dinit.d/postfix-pre"
}
