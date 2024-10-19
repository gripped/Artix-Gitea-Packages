# Maintainer: artist for Artix Linux

pkgname=gtklock
pkgver=3.0.0
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-session-lock wayland pam)
makedepends=(meson git scdoc)
provides=('gtklock')
conflicts=('gtklock')
source=("$pkgname::git+$url.git")

build() {
	artix-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

sha256sums=('SKIP')

