# Maintainer: nous@artixlinux.org
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_pkgname=lxterminal
pkgname=$_pkgname-gtk2
pkgver=0.4.1
pkgrel=1
pkgdesc="VTE-based terminal emulator (part of LXDE), GTK2 version"
arch=('x86_64')
url='https://github.com/lxde/lxterminal'
license=('GPL2')
groups=('lxde-gtk2')
depends=(
  gdk-pixbuf2
  glib2
  gtk2
  hicolor-icon-theme
  libx11
  pango
  vte-legacy
)
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/lxterminal.git#tag=$pkgver"
  lxterminal.appdata.xml
  lxterminal-transient-dialog.patch
  lxterminal-fix-crash-on-close.patch
)
b2sums=(
  6c44a19ef2a00593773efe7c1a7259e9a25c47de4cb7b623fd7ddeb65ce5e03bc5d09d48690155ac812dc7beb878e0ce21f986cf67ef57191f707d7dd5abcba2
  049f5cb1d453d6d59f2e71be245432938778554c7d3dab7cfbf1ee2a8031634681b79367e7f9080fae1a26d7974bd9d6b91a49f100c6b862dc6967d1e29e62f4
  12a0f6800cd67bc75a9ffb7bf05bc60749d16e62e52bd3947287c5ee214c7865d4fba935ae8d368917570738d56a14adc1f6f7eb85139ee7863c370dbb3e87c6
  e0b3c2e9a236eed007d2d95a58c78d97f045914abebe40c41cfb6624183ae0c9aaeae8defa42dc4e8443d395688b03cacb3b126f06a4c11c3de4e86c582b1237
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxterminal/pull/133
  git apply -3 ../lxterminal-transient-dialog.patch

  # https://github.com/lxde/lxterminal/pull/135
  git cherry-pick -n 3fa3a935bdacbcedccf51bea4b8b3c0a396b10ee
  git apply -3 ../lxterminal-fix-crash-on-close.patch

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
  install -Dm644 ../$_pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
}
