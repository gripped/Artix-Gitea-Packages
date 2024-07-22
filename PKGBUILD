# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor:  <mathieu.clabaut@gmail.com>

pkgname=xdg-user-dirs
pkgver=0.18
pkgrel=2
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
url="https://www.freedesktop.org/wiki/Software/xdg-user-dirs"
arch=(x86_64)
license=(GPL)
depends=(sh)
makedepends=(docbook-xsl git)
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
install=xdg-user-dirs.install
options=(!emptydirs)
_commit=52e71ff04416f2ca3adaf6d73193de4b8b83de46  # tags/0.18^0
source=("git+https://gitlab.freedesktop.org/xdg/xdg-user-dirs.git#commit=$_commit")
sha256sums=('a63a58e5a5541e7fde10a458231092be65d042e651f68840049c208b831d5611')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install 
}
