# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor:  <mathieu.clabaut@gmail.com>

pkgname=xdg-user-dirs
pkgver=0.18
pkgrel=2.1
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
url="https://www.freedesktop.org/wiki/Software/xdg-user-dirs"
arch=(x86_64)
license=(GPL)
depends=(sh)
makedepends=(docbook-xsl git)
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
options=(!emptydirs)
_commit=52e71ff04416f2ca3adaf6d73193de4b8b83de46  # tags/0.18^0
source=("git+https://gitlab.freedesktop.org/xdg/xdg-user-dirs.git#commit=$_commit"
        90-xdg-user-dirs)
sha256sums=('a63a58e5a5541e7fde10a458231092be65d042e651f68840049c208b831d5611'
            'f0f27de23d849b2fa4ebf59e448b5a843b577d14dc2c1070e228999091fa7f5e')

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
  install -Dm755 "${srcdir}"/90-xdg-user-dirs "${pkgdir}"/etc/X11/xinit/xinitrc.d/90-xdg-user-dirs.sh
  make DESTDIR="$pkgdir" install 
}
