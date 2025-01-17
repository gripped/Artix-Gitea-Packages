# Maintainer: nous <nous@artixlinux.org>

pkgname=opensnitch-openrc
pkgver=20250117
pkgrel=1
pkgdesc="OpenRC opensnitch init script"
arch=('any')
url="https://gitea.artixlinux.org/packages/opensnitch-openrc"
license=('GPL2')
groups=('openrc-galaxy')
provides=('init-opensnitch')
depends=('openrc' 'opensnitch')
conflicts=('init-opensnitch')
source=(opensnitch.{confd,initd})
sha256sums=('d73eb6fc5e092c9b6a591addc3d0274d34659cb636ba1e3132c80f5bb70a6b41'
            '32b128a4383890f4ac73c75dd98498054d3469461495ddcbb2be42e01f168975')

package() {
    install -Dm755 "${srcdir}/opensnitch.initd" "${pkgdir}/etc/init.d/opensnitch"
    install -Dm644 "${srcdir}/opensnitch.confd" "${pkgdir}/etc/conf.d/opensnitch"
}
