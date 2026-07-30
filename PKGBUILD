# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dbus-runit
pkgver=20260730
pkgrel=1
pkgdesc='runit service scripts for dbus'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
depends=('dbus' 'runit')
optdepends=('userspawn-runit: per-user runsvdir for the session bus template')
makedepends=('git')
provides=('dbus-runscripts' 'init-dbus')
conflicts=('init-dbus')
replaces=('dbus-runscripts')
install='dbus-runit.install'
_alpm_tag=3.0
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm_tag"
        'dbus.run'
        'dbus.check'
        'dbus.log.run'
        'dbus.user.run'
        '80-dbus.sh')

b2sums=('654b9166c85afd17ccaf4deed1803669b2a38fa36399dc83e399aa7b6261f6a58fe79609d3840cec55a84cbe2e7e5e403569412baedc274988d37ca8693bf14e'
        'ba3c92be8e5472a2098a96e8b2a483161e0750de31fb6c28880cf8c66b189d68006f62dc0e61ea643342b6484b65f0dc6eed46b58b681c27f7059b78817fb89a'
        '0e84aebbd8d84213d7eea5828ea94a69a2c185fbbb684b9856735041921cac7299057a55902f44ce4084217fe869d58ee7054efc7d2b29876755bfabc2ae9722'
        'c1a8f17b67358709895f6db580316649e2815a9be895417ac5c4ed916b4df8230ddd8a72ac6c899185ada9c30567ee9f41815b99fc064c556350370b2d82569f'
        '2815e75c04546a389aaf20ee50580f261e067beace17cdb9f077edf96d04c949d2c77e6524c3a1610ef5ab2032918a97705e5c7689e49d5babeb82f380f38921'
        '3809bd5a43f3dc1b9dbed8ebf3274176e3e68df4216826aeead55b5dc6bc44ca926b59c0b83c23d0897175cd90d86a6afd9f93492152f71f7861f71eb343146b')

package() {
    cd "$srcdir"

    install -Dm755 dbus.user.run "$pkgdir/etc/runit/user/sv/dbus/run"
    install -Dm755 dbus.run "$pkgdir/etc/runit/sv/dbus/run"
    install -Dm755 dbus.check "$pkgdir/etc/runit/sv/dbus/check"
    install -Dm755 dbus.log.run "$pkgdir/etc/runit/sv/dbus/log/run"

    install -d "${pkgdir}/etc/runit/runsvdir/default"
    ln -s "../../sv/dbus" "${pkgdir}/etc/runit/runsvdir/default/dbus"

    install -Dm755 80-dbus.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/80-dbus.sh"

    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_runit_dbus
}
