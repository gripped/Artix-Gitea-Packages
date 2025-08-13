# Maintainer: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=syncthing-openrc
pkgver=20250814
pkgrel=1
pkgdesc="OpenRC syncthing init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-galaxy')
depends=('openrc' 'syncthing')
provides=('init-syncthing')
conflicts=('init-syncthing')
backup=('etc/conf.d/syncthing')
source=('syncthing.'{initd,confd})
sha256sums=('6a69bc46e84977f9897a0559e91155c78c34cb68f113ac7d311a4cab34c2d367'
            '7592b3be5a8adc1e6a8f488797f569e62422956ade8625ca9e43a09bbaf01d7d')

package() {
  cd "$srcdir"
  install -Dm755 syncthing.initd "$pkgdir"/etc/init.d/syncthing
  install -Dm644 syncthing.confd "$pkgdir"/etc/conf.d/syncthing
}
