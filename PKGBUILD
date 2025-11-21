# Maintainer: artist for ArtixLinux

_pkgname=lxsession
pkgname=$_pkgname-gtk2
pkgver=0.5.6
pkgrel=3
epoch=1
pkgdesc='Lightweight X11 session manager, GTK2 version'
arch=('x86_64')
url="https://lxde.org/"
license=('GPL2')
depends=('gtk2' 'polkit')
makedepends=('intltool' 'docbook-xsl' 'vala' 'git')
conflicts=($_pkgname 'lxpolkit')
provides=($_pkgname)
groups=('lxde-gtk2')
source=("git+https://github.com/lxde/$_pkgname.git#tag=$pkgver")
sha256sums=('552d9331d30c0349b28699ec51de201b23586b209ffb5ac6e32372117dc44557')

prepare() {
  cd $_pkgname

  sh autogen.sh
  # https://github.com/lxde/lxsession/pull/43
  sed -i 's/which /command -v /' lxlock/lxlock
  # https://github.com/lxde/lxsession/pull/44
  sed -i 's/^NotShowIn=.*/OnlyShowIn=LXDE;/' data/lxpolkit.desktop.in.in
  autoreconf -fi
}

build() {
  export CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"
  cd $_pkgname
  ./configure --sysconfdir=/etc --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
