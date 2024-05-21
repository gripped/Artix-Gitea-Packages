# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=pptpd-dinit
pkgver=20211105
pkgrel=4
pkgdesc="dinit service scripts for pptpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('pptpd' 'dinit')
conflicts=('init-pptpd')
provides=('init-pptpd')
source=("pptpd")
sha256sums=('200943f8bc1cfb483db8630db5041272a4d4444a97898c839016c8ce67da0b68')

package() {
    install -Dm644 pptpd "$pkgdir/etc/dinit.d/pptpd"
}
