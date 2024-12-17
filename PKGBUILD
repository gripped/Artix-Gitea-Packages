# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=libxfce4windowing
pkgver=4.20.0
pkgrel=2
pkgdesc="Windowing concept abstraction library for X11 and Wayland"
arch=('x86_64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL-2.1-only')
depends=('gdk-pixbuf2' 'glib2' 'gtk3' 'libwnck3' 'libdisplay-info' 'libx11' 'wayland')
makedepends=('glib2-devel' 'gobject-introspection' 'gtk-doc' 'wayland-protocols' 'xfce4-dev-tools')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('56f29b1d79606fb00a12c83ef4ece12877d2b22bf1acaaff89537fbe8e939f68')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --enable-wayland \
    --enable-x11 \
    --disable-debug
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
