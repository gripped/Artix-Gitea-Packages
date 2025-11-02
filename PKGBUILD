# Maintainer: nous
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Filipp "Scorp" Andjelo <scorp@mailueberfall.de>

_pkgname=lxinput
pkgname=$_pkgname-gtk2
pkgver=0.3.6
pkgrel=2
pkgdesc="Small program to configure keyboard and mouse for LXDE, GTK2 version"
arch=('x86_64')
url='https://github.com/lxde/lxinput'
license=('GPL')
groups=('lxde-gtk2')
depends=('gtk2')
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/lxinput.git#tag=$pkgver"
  lxinput-notshowin.patch
  lxinput-x11-only.patch
)
b2sums=('35f17ab642d2da3099fa5593592ae2b96aaaba19f746328e6a271ca9d8689b5f1f5cb925e9ca92b86600719966601b1be969e84d6afce2034fe8da6a64a2db13'
        'dc2db0560bb6a66629dbc78f44b0daf45c33f102723ccc9a9df9c140510a473fdd432ca182f8a9b0a68df9f52a1d9c418e658b4ff4e7f9f74f9a87efc3238875'
        '9091737f4ec768b62afd599602d6440884b6b685578af1fd1009086777a247425a49f6438e75d7ba03e4ee686e1cd65879c38af12dff9dfeca41b3b2d3709228')

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxinput/pull/3
  git apply -3 ../lxinput-notshowin.patch

  # https://github.com/lxde/lxinput/pull/4
  git apply -3 ../lxinput-x11-only.patch

  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-gtk=2
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
