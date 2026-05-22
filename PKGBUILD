# Contributor: capezotte <https://gitea.artixlinux.org/capezotte>
# Adapted from scripts by: aur.archlinux.org/account/kbtz

pkgname=keyd-openrc
pkgdesc="OpenRC init scripts for keyd"
pkgver=20260522
pkgrel=1
arch=('any')
url="https://aur.archlinux.org/packages/keyd-openrc"
license=('MIT')
groups=('openrc-galaxy')
depends=('openrc' 'keyd')
source=('keyd.initd' 'usb-gadget.initd')
b2sums=('07cbc7371e1e9d915e593071ec5f2054dbbc1c938448684e4a21fd44c09e4a3fa5920755124fa61297aa57ba082d77ea4f157f0e9c139bd9b08a3ab51aaaa60b'
        '2d3f5ae415398a33f7b0734092cfa3b82e3b277f54e9506fa83873830d4f139404856191568cb2a58cdc998f7908a64308884323e6e3cca24f23125afc76d138')

package() {
	install -Dm 755 keyd.initd "$pkgdir/etc/init.d/keyd"
	# usb-gadget left unused - does not seem relevant for x86_64
}
