# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal-gtk
pkgver=1.14.1
pkgrel=2
pkgdesc="A backend implementation for xdg-desktop-portal using GTK"
url="https://github.com/flatpak/xdg-desktop-portal-gtk"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 gsettings-desktop-schemas)
makedepends=(xdg-desktop-portal python git)
optdepends=("evince: Print preview")
provides=(xdg-desktop-portal-impl)
_commit=952005f6a7850a247d286f14838202f506b402b7  # tags/1.14.1^0
source=("git+https://github.com/flatpak/xdg-desktop-portal-gtk#commit=$_commit"
        gtk-portals.conf)
sha256sums=('SKIP'
            '7021091f9257d6db3599b0b9cec64ce22fe303500fdee36e1e50945ef83c2c88')

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
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install

  # fix detection with x-d-p 1.18
  install -Dm644 ${srcdir}/gtk-portals.conf  ${pkgdir}/usr/share/xdg-desktop-portal/gtk-portals.conf
}

# vim:set sw=2 sts=-1 et:
