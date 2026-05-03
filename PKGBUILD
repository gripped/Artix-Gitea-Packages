# Maintainer: arc-d3v <arc-d3v@artixlinux.org>

pkgname=mullvad-vpn-dinit
pkgver=1.0
pkgrel=1
pkgdesc="dinit service for Mullvad"
url="https://artixlinux.org"
arch=('any')
license=('GPL')
provides=('init-mullvad')
conflicts=('init-mullvad')
depends=('dinit' 'mullvad-vpn-daemon')
source=("mullvad-daemon" "mullvad-early-boot-blocking")
sha256sums=('1b90727be3b78e4847508a0c38ad2213e950f91db48fed90b14e263fac889a83'
  'e15849257dc799da2ad56552d885acb4171c4209f39accbb922a419d7609b956')

package() {
  install -Dm644 ${srcdir}/mullvad-daemon "$pkgdir/etc/dinit.d/mullvad-daemon"
  install -Dm644 ${srcdir}/mullvad-early-boot-blocking "$pkgdir/etc/dinit.d/mullvad-early-boot-blocking"
}
