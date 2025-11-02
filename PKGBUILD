# Maintainer: artist for Artix Linux

_pkgname=lxappearance
pkgname=$_pkgname-gtk2
pkgver=0.6.4
pkgrel=2
pkgdesc='Feature-rich GTK+ theme switcher of the LXDE Desktop, GTK2 version'
arch=('x86_64')
license=('GPL2')
url='https://wiki.lxde.org/en/LXAppearance'
depends=('gtk2')
makedepends=('git' 'intltool' 'dbus-glib')
conflicts=($_pkgname)
provides=($_pkgname)
proups=('lxde-gtk2')
source=(git+https://github.com/lxde/lxappearance.git#tag=${pkgver})
sha256sums=('94e0a5b3e362c3b0323df3c6a672f5546eca6acd896dbe9708e16042df10fc24')

prepare() {
  cd $_pkgname
  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure --sysconfdir=/etc --prefix=/usr --enable-dbus --enable-gtk2
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

