# Contributor: dreieck
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=ipp-usb-openrc
pkgver=20260924
pkgrel=1
pkgdesc="OpenRC ipp-usb init script"
arch=('any')
url="https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/ipp-usb/"
license=('GPL-2.0-only')
groups=('openrc-galaxy')
provides=('init-ipp-usb')
depends=('openrc' 'ipp-usb')
conflicts=('init-ipp-usb')
backup=('etc/conf.d/ipp-usb')
source=(ipp-usb.initd)
sha256sums=('6ade8e80662c89f4f4533a4494e5d603f91f50f9785d4158c3a611905c084946'
            '76e3b2fea25685dab786dc5f0f3d499f9a84d4cc9c6534af79020b041301bab2')

package() {
    install -Dm755 "$srcdir/ipp-usb.initd" "$pkgdir/etc/init.d/ipp-usb"
}
