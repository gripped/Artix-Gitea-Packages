# Maintainer: mochaaP <aur@mochaa.ws>
# Maintainer: nous

pkgname=rustdesk-openrc
pkgver=20260219
pkgrel=1
pkgdesc='OpenRC rustdesk init script'
arch=('any')
license=('GPL')
depends=('rustdesk' 'openrc')
source=('rustdesk.initd')
sha256sums=('1c958753ec41a7fae7e62a4b04a8739bd5ac519a68e10d67e4b164fd9e3ae7d6')

package() {
    install -Dm755 'rustdesk.initd' "${pkgdir}/etc/init.d/rustdesk"
}
