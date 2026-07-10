# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=forgejo-runner-openrc
pkgver=20260710
pkgrel=1
pkgdesc="OpenRC forgejo-runner init script"
arch=('any')
url="https://gitea.artixlinux.org/packages"
license=('GPL2')
groups=('openrc-galaxy')
provides=(
    'init-forgejo-runner'
    'forgejo-runner-openrc'
)
depends=('openrc' 'forgejo-runner')
conflicts=(
    'init-forgejo-runner'
)
source=(forgejo-runner.{initd,confd})
sha256sums=('49bb924e1b49509e4044b52068fce6a2f9fd79b52b306cfb15f208f01aa5a704'
            '3e98cbc9a5e922787ca4d83cf14672b9bb93ce26f7f49da8f8e9a64850f9ffe0')

package() {
    install -Dm755 "${srcdir}"/forgejo-runner.initd "${pkgdir}"/etc/init.d/forgejo-runner
    install -Dm644 "${srcdir}"/forgejo-runner.confd "${pkgdir}"/etc/conf.d/forgejo-runner
}

