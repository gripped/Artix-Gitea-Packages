# Maintainer: nous <nous@artixlinux.org>

_pkgname=lxhotkey
pkgname=$_pkgname-gtk2
pkgver=0.1.1
pkgrel=2.1
pkgdesc='Keyboard shortcuts configurator (part of LXDE), GTK2 version'
arch=('x86_64')
license=('GPL2')
groups=('lxde-gtk2')
url='https://github.com/lxde/lxhotkey'
depends=('gtk2' 'libfm')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://github.com/lxde/lxhotkey.git#tag=$pkgver")
sha256sums=('24e60672c5baccfa0680469c95c905ff6edd7c1d7dcf91fe830a96d0c039e141')

prepare() {
  cd $pkgbase-$pkgver
  ./autogen.sh
}

build() {
  # GTK+ 2 version
  [ -d gtk2 ] || cp -r $pkgbase-$pkgver gtk2
  cd gtk2
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=2
  make
}

package() {
  cd gtk2
  make DESTDIR="$pkgdir" install
}
