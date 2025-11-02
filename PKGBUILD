# Maintainer: nous
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_pkgname=lxlauncher
pkgname=$_pkgname-gtk2
pkgver=0.2.8
pkgrel=2.1
pkgdesc='Open source clone of the Asus launcher for EeePC, GTK2 version'
arch=('x86_64')
license=('GPL2')
groups=('lxde-gtk2')
url='https://github.com/lxde/lxlauncher'
depends=(
  cairo
  gdk-pixbuf2
  glib2
  gtk2
  libx11
  lxmenu-data
  menu-cache
  startup-notification
)
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
backup=('etc/xdg/lxlauncher/gtk.css'
        'etc/xdg/lxlauncher/gtkrc'
        'etc/xdg/lxlauncher/settings.conf')
source=("git+https://github.com/lxde/lxlauncher.git#tag=$pkgver")
b2sums=(260cb4ad514381bc9cb4230f98227d9f43dd4237a031604fdcf93de47d680bc2b0127833de6008b113839277fbd1a39db7239d5b42a5855bbbb8b9df6dca7847)

prepare() {
  cd $_pkgname
  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var --with-gtk=2
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
