# Contributor: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=prometheus-openrc
pkgver=20260912
pkgrel=1
pkgdesc="OpenRC prometheus init script"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/app-metrics/prometheus"
license=('GPL-2.0-only')
groups=('openrc-world')
provides=('init-prometheus')
depends=('openrc' 'prometheus')
conflicts=('init-prometheus')
backup=('etc/conf.d/prometheus')
source=("prometheus".{confd,initd})
sha256sums=('6ade8e80662c89f4f4533a4494e5d603f91f50f9785d4158c3a611905c084946'
            '76e3b2fea25685dab786dc5f0f3d499f9a84d4cc9c6534af79020b041301bab2')

package() {
    install -Dm755 "$srcdir/prometheus.initd" "$pkgdir/etc/init.d/prometheus"
    install -Dm644 "$srcdir/prometheus.confd" "$pkgdir/etc/conf.d/prometheus"
}
