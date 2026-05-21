# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=tmux
pkgver=3.6_b
pkgrel=2
pkgdesc='Terminal multiplexer'
url='https://github.com/tmux/tmux/wiki'
arch=('x86_64')
license=('BSD')
depends=('libevent' 'libevent_core-2.1.so'
         'libutempter'
         'ncurses' 'libncursesw.so'
          'libudev.so')
makedepends=('git' )
source=("git+https://github.com/tmux/tmux.git#tag=${pkgver/_/}")
sha256sums=('ab7fbfcb827a93eb7da177d45b50af4710f913f7b2db34037527e8235cda1e97')

prepare() {
	cd "$pkgname"

	sh autogen.sh
}

build() {
	cd "$pkgname"

	./configure \
		--prefix=/usr \
		--enable-sixel \
		--disable-systemd \
		--enable-utempter
	make
}

package() {
	cd "$pkgname"

	make install DESTDIR="$pkgdir"
	install -D -m0644 COPYING "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
