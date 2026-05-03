# Maintainer: arc-d3v <arc-d3v@artixlinux.org>

pkgname=mullvad-vpn-dinit
pkgver=1.1
pkgrel=1
pkgdesc="dinit service for Mullvad"
url="https://artixlinux.org"
arch=('any')
license=('GPL')
provides=('init-mullvad')
conflicts=('init-mullvad')
depends=('dinit' 'mullvad-vpn-daemon')
source=("mullvad-daemon" "mullvad-early-boot-blocking")
sha256sums=('cf754f51eb20ed7608aa64e7c3db6e31caf0e23d07ac45f0aba25532eb4fdda1'
  '37e950810a5c4376f714550356a47c69701f9da846d5ebc2e48d6b2d130bcabb')

package() {
  install -Dm644 ${srcdir}/mullvad-daemon "$pkgdir/etc/dinit.d/mullvad-daemon"
  install -Dm644 ${srcdir}/mullvad-early-boot-blocking "$pkgdir/etc/dinit.d/mullvad-early-boot-blocking"
}
