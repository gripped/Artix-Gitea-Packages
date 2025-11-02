# Maintainer: artist for Artix Linux

_pkgname=lxpanel
pkgname=$_pkgname-gtk2
pkgver=0.11.1
pkgrel=3.1
pkgdesc='Lightweight X11 desktop panel for LXDE, GTK2 version'
arch=('x86_64')
license=('GPL2')
url='https://lxde.org/'
groups=('lxde-gtk2')
depends=('alsa-lib' 'curl' 'menu-cache' 'lxmenu-data' 'libwnck' 'libfm-gtk2' 'libkeybinder2')
makedepends=('git' 'intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
provides=($_pkgname)
source=(git+https://github.com/lxde/lxpanel.git#tag=${pkgver})
sha256sums=('262d261e14a13e6df1bb1a0406afee1e69f6da0891269a3e0a865507d04d5a95')

prepare() {
  cd $_pkgname
  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr \
    --enable-gtk2

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

