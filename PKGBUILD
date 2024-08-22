# Maintainer: nous@artixlinux.org

pkgname=tigervnc-openrc
pkgver=20240822
pkgrel=1
pkgdesc="OpenRC tigervnc init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-galaxy')
depends=('openrc' 'tigervnc')
provides=('init-tigervnc')
conflicts=('init-tigervnc')
backup=('etc/conf.d/tigervnc')
source=("tigervnc.initd"
        "tigervnc.confd")
sha256sums=('8485bab94de07c4a4bb3f0187353870795915889d1f5cce9d483023fcdca2791'
            '48b6ae4f3e9e528b3cd4bc1349ceed3cd1a403ab0f3a2a8dd57a4769f88ceafc')

package() {
	install -Dm755 "$srcdir/tigervnc.initd" "$pkgdir/etc/init.d/tigervnc"
	install -Dm644 "$srcdir/tigervnc.confd" "$pkgdir/etc/conf.d/tigervnc"
}
