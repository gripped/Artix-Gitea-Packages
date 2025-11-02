# Maintainer: artist for Artix Linux

_pkgname=lxappearance-obconf
pkgname=$_pkgname-gtk2
pkgver=0.2.4
pkgrel=3
pkgdesc='Plugin for LXAppearance to configure Openbox'
arch=(x86_64)
url='https://github.com/lxde/lxappearance-obconf'
license=(GPL-2.0-or-later)
groups=(lxde-gtk2)
depends=(cairo gdk-pixbuf2 glib2 glibc gtk2 libx11 libxml2 lxappearance openbox)
makedepends=(git intltool)
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://github.com/lxde/lxappearance-obconf.git#tag=$pkgver")
b2sums=('a3d5180df27c839c9724ad30a736b3a22d834189e30a05837f9aa947535ce6c5a351ea3060dff5aba131130b2cdfca35d0ea50a6d104b1094b5f5b3f5e11e483')

prepare() {
  cd $_pkgname
  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk2
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

