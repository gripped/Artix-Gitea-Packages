# Contributor: capezotte@artixlinux.org
# Contributor: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=grafana-openrc
pkgver=20260912
pkgrel=1
pkgdesc="OpenRC grafana init script"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/www-apps/grafana-bin"
license=('GPL2')
groups=('openrc-galaxy')
depends=('openrc' 'grafana')
provides=('init-grafana')
conflicts=('init-grafana')
backup=('etc/conf.d/grafana')
source=("grafana.confd"
        "grafana.initd")
sha256sums=('cfe4a2f32d7ad8ed4c2f09f0cb29f3a133a32eac4eb2d36a8442702b620b23a8'
            '75eadb20b0db712ef82b48dce6a08cafd348f53016812aed0fb9faad5dee93f1')

package() {
    install -Dm755 "$srcdir/grafana.initd" "$pkgdir/etc/init.d/grafana"
    install -Dm644 "$srcdir/grafana.confd" "$pkgdir/etc/conf.d/grafana"
}
