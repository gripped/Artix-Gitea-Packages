# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=tmux
pkgver=3.7_a
pkgrel=1
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
sha256sums=('6f3aab5f96d01cb7af53de47b2305a147f7e5765b11a23c95d28a1cbe118233f')

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
