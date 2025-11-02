# Maintainer: nous <nous@artixlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_pkgname=lxrandr
pkgname=$_pkgname-gtk2
pkgver=0.3.3
pkgrel=1
pkgdesc="Monitor configuration tool (part of LXDE), GTK2 version"
arch=('x86_64')
license=('GPL2')
groups=('lxde-gtk2')
url='https://github.com/lxde/lxrandr'
depends=('glib2' 'gtk2' 'xorg-xrandr')
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/lxrandr.git#tag=$pkgver"
  lxrandr-notshowin.patch
  lxrandr-x11-only.patch
)
b2sums=(
  2a38a2c41f1e45e6bd0cee2e648c477222ec853a091ff410a358788440fa4ea4efe3fafa08aefc9e78e19dc725c1452694b18deb6704b04b05ace82f000c4524
  3cdd9ad9503892f27bdfd8a7eff39617b1880b5dd57d66e3d9e831104388506789d6273658d629de8a6d09bd6d6aa83b8211ca4f52c1de1884df55d985e604ac
  0b4e6e7c0960ce5b258c0c84372803da1e81f53edc6986d33d1013aabcf687d5f3f105ac0f1f9a6675ef9eb58995c9212ffe0ba3ae74d6062413bad3a2e1d39b
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxrandr/pull/7
  git apply -3 ../lxrandr-notshowin.patch

  # https://github.com/lxde/lxrandr/pull/8
  git apply -3 ../lxrandr-x11-only.patch

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
