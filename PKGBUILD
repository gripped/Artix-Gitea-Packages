# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>

pkgname=tmux
pkgver=3.4
pkgrel=1
pkgdesc='Terminal multiplexer'
url='https://github.com/tmux/tmux/wiki'
arch=('x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'libutempter')
source=("https://github.com/tmux/tmux/releases/download/${pkgver/_/}/tmux-${pkgver/_/}.tar.gz")
sha256sums=('551ab8dea0bf505c0ad6b7bb35ef567cdde0ccb84357df142c254f35a23e19aa')

build() {
	cd "$pkgname-${pkgver/_/}"

	./configure \
		--prefix=/usr \
		--enable-utempter \
		--disable-systemd
	make
}

package() {
	cd "$pkgname-${pkgver/_/}"

	make install DESTDIR="$pkgdir"
	install -D -m0644 COPYING "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
