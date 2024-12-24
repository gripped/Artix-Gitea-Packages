# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-eyes-plugin
pkgver=4.6.1
pkgrel=1
pkgdesc="A rolling eyes (following mouse pointer) plugin for the Xfce panel"
arch=('x86_64')
url="https://docs.xfce.org/panel-plugins/xfce4-eyes-plugin/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'hicolor-icon-theme')
makedepends=('git' 'perl-xml-parser' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-eyes-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('c5afff8a7c4ff3fe1f94e34ed746eda394ddc47e9428a85e60559e5516fafb8a')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
