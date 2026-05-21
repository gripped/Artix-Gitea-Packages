# Maintainer: artoo <artoo@artixlinux.org>

pkgname=gitea-runner-openrc
pkgver=20260521
pkgrel=2
pkgdesc="OpenRC gitea-runner init script"
arch=('any')
url="https://gitea.artixlinux.org/packages"
license=('GPL2')
groups=('openrc-galaxy')
provides=(
    'init-gitea-runner'
    'init-act-runner'
    'act-runner-openrc'
)
depends=('openrc' 'gitea-runner')
conflicts=(
    'init-gitea-runner'
)
replaces=(
    'act-runner-openrc'
)
source=(gitea-runner.{initd,confd})
sha256sums=('236b6a10d607cca568b9da64bb723ef6e4143528adfe79859354c8a383be0137'
            '76c2a85b7657bc11d8042ff069527d03be043d9c28fd83e953d7b3ba6c26ca3d')

package() {
    install -Dm755 "${srcdir}"/gitea-runner.initd "${pkgdir}"/etc/init.d/gitea-runner
    install -Dm644 "${srcdir}"/gitea-runner.confd "${pkgdir}"/etc/conf.d/gitea-runner
}

