# Maintainer: nous <nous@artixlinux.org>

pkgname=knockd-openrc
pkgver=20250331
pkgrel=1
pkgdesc="OpenRC knockd init script"
arch=('any')
url="https://gitea.artixlinux.org/packages/knockd-openrc"
license=('GPL2')
groups=('openrc-galaxy')
provides=('init-knockd')
depends=('openrc' 'knockd')
conflicts=('init-knockd')
source=(knockd.{confd,initd})
sha256sums=('8e78581d8239f17f4176cc0c850ec64957e9b4ad669c114329e052c3d6759934'
            'cb65868f3911a3c573cdadd7457c99271c0d92011d42599ff4bd64787dc20f52')

package() {
    install -Dm755 "${srcdir}/knockd.initd" "${pkgdir}/etc/init.d/knockd"
    install -Dm644 "${srcdir}/knockd.confd" "${pkgdir}/etc/conf.d/knockd"
}
