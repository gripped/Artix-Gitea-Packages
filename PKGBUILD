# Maintainer: nous <nous@artixlinux.org>

_pkgname=incron
pkgname=${_pkgname}-openrc
pkgver=20250303
pkgrel=1
pkgdesc="OpenRC ${_pkgname} init script"
arch=('any')
url="https://gitea.artixlinux.org/packages/${_pkgname}-openrc"
license=('GPL2')
groups=('openrc-galaxy')
provides=(init-${_pkgname})
depends=('openrc' "${_pkgname}")
conflicts=(init-${_pkgname})
backup=(etc/conf.d/${_pkgname})
source=(${_pkgname}.{confd,initd})
sha256sums=('efd81915876a5b36944ebc51d15791f9f05837a093d907d5ff14f2c770617443'
            'b56a1f0cac663c7b0b6f96dfe84cef15dbeade3f9565c6007b4d741fe0cff34a')
install=${_pkgname}.install

package() {
    install -Dm755 "${srcdir}/${_pkgname}.initd" "${pkgdir}/etc/init.d/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.confd" "${pkgdir}/etc/conf.d/${_pkgname}"
}
