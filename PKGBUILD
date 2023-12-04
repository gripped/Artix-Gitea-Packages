# Maintainer: artoo <artoo@artixlinux.org>

pkgname=act-runner-openrc
pkgver=20231204
pkgrel=1
pkgdesc="OpenRC act-runner init script"
arch=('any')
url="https://gitea.artixlinux.org/packages"
license=('GPL2')
groups=('openrc-galaxy')
provides=('init-act-runner')
depends=('openrc' 'act-runner')
conflicts=('init-act-runner')
source=("act_runner.initd")
sha256sums=('60808ef1576dd549ade13ba6c45095d428777957415a83bd4dee75d799ee6e9c')

package() {
    install -Dm755 "${srcdir}"/act_runner.initd "${pkgdir}"/etc/init.d/act_runner
}

