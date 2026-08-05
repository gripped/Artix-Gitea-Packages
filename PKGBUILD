# Maintainer: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=at-openrc
pkgver=20260805
pkgrel=1
pkgdesc="OpenRC at init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-galaxy')
provides=('init-atd')
depends=('openrc' 'at')
makedepends=('git')
conflicts=('init-atd')
backup=('etc/conf.d/atd')
_alpm_tag=3.0
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm_tag"
        atd.{confd,initd})
sha256sums=('9ac686c2d7caaf9bd96122db26c5b2af82a308dcbee331f3ce0b807ef5b800ee'
            'ab023e245103b6e0786ad1888143fdb87933ff5937114ac086f0616d6b620c02'
            'd0a18f3dc45e42074fa071e915a847a5bb84faa1365e5a667bafea607f178526')

package() {
    install -Dm755 "${srcdir}/atd.initd" "${pkgdir}/etc/init.d/atd"
    install -Dm644 "${srcdir}/atd.confd" "${pkgdir}/etc/conf.d/atd"

    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_openrc_at
}
