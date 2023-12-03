# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_pkgname=gitea
pkgname=gitea-openrc
pkgver=20231203
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
            '32173d9b4f9a4d891c87af72b86055806298a7905a261aef466addbdc7da45af')

package() {
  install -Dm0644 "${srcdir}/${_pkgname}.confd" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -Dm0755 "${srcdir}/${_pkgname}.initd" "${pkgdir}/etc/init.d/${_pkgname}"
}
