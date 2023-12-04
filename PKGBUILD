# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_pkgname=gitea
pkgname=gitea-openrc
pkgver=20231204
pkgrel=1
pkgdesc="OpenRC Gitea init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-world')
depends=('openrc' 'gitea')
provides=('init-gitea')
conflicts=('init-gitea')
backup=('etc/conf.d/gitea')
source=("gitea.confd"
        "gitea.initd")
sha256sums=('1ae952b4401b88d495106bb3d31314376ec3283e3a15d03405abda1af00397a0'
            '4d88928af6d78aed295585705facd2121ccd913ead0e93c44bf2a378debf1042')

package() {
  install -Dm0644 "${srcdir}/${_pkgname}.confd" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -Dm0755 "${srcdir}/${_pkgname}.initd" "${pkgdir}/etc/init.d/${_pkgname}"
}
