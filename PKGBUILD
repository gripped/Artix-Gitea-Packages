# Maintainer: nous@artixlinux.org

pkgname=tigervnc-openrc
pkgver=20240823
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
sha256sums=('8adf1b98fb28b28bd6a39770e83dd326a3b3d23a8405e157d3073ebd9a31e1f0'
            '48b6ae4f3e9e528b3cd4bc1349ceed3cd1a403ab0f3a2a8dd57a4769f88ceafc')

package() {
	install -Dm755 "$srcdir/tigervnc.initd" "$pkgdir/etc/init.d/tigervnc"
	install -Dm644 "$srcdir/tigervnc.confd" "$pkgdir/etc/conf.d/tigervnc"
}
