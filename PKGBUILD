# Maintainer: artoo <artoo@artixlinux.org>

pkgname=act-runner-openrc
pkgver=20250501
pkgrel=1
pkgdesc="OpenRC act-runner init script"
arch=('any')
url="https://gitea.artixlinux.org/packages"
license=('GPL2')
groups=('openrc-galaxy')
provides=('init-act-runner')
depends=('openrc' 'act-runner')
conflicts=('init-act-runner')
source=(act_runner.{initd,confd})
sha256sums=('8101610cdc1960eba8fa7e4b2790402d3378f8ed967938117cf377025b7f3518'
            '0c9fbd759dec2853cee45a1acb3f7cf1efe1152db125d90fe18dae7405452cae')

package() {
    install -Dm755 "${srcdir}"/act_runner.initd "${pkgdir}"/etc/init.d/act_runner
    install -Dm644 "${srcdir}"/act_runner.confd "${pkgdir}"/etc/conf.d/act_runner
}

