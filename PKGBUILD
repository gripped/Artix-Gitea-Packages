# Maintainer: artoo <artoo@artixlinux.org>

pkgname=cronie-openrc
pkgver=20260805
pkgrel=1
pkgdesc="OpenRC cronie init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-system')
provides=('init-cronie' 'init-cron')
depends=('openrc' 'cronie')
makedepends=('git')
conflicts=('fcron' 'init-cronie' 'init-cron')
backup=('etc/init.d/cronie')
_alpm_tag=3.0
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm_tag"
        'cronie.initd')
sha256sums=('9ac686c2d7caaf9bd96122db26c5b2af82a308dcbee331f3ce0b807ef5b800ee'
            '4423ab44c307b21224c43f2fc9b310f4a7f8587bba7a472bd8194137a0f702b9')

package() {
    install -Dm755 "${srcdir}"/cronie.initd "${pkgdir}"/etc/init.d/cronie

    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_openrc_cronie
}
