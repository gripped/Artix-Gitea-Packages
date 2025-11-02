# Maintainer: nous
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

_pkgname=lxtask
pkgname=$_pkgname-gtk2
pkgver=0.1.12
pkgrel=1
pkgdesc='Task manager of the LXDE Desktop, GTK2 version'
arch=('x86_64')
license=('GPL2')
groups=('lxde-gtk2')
url='https://github.com/lxde/lxtask'
depends=('glib2' 'gtk2')
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/lxtask.git#tag=$pkgver"
  lxtask.appdata.xml
  lxtask-transient-dialog.patch
)
b2sums=('00fd38d16feb818c2a3c1356b3984882e425821aeff4a7f75caa04aeec5052d1f494536400fce307061642129c65487ad8846e5af546c67d368b863190c331e5'
        'd52df1095650dd326fe794d0c08461c1b4c9c3bf2a31ea7f737596423011d90d12d7f613882a401534d07ed29af02578ae8583813cf7da0b1bc94f8ad45c3879'
        '7e61be192df34fb12b3117e2e99562c472e2cdf0e594b4db9bc4dcf3703eacd5740353c4fc8e62943b75097c227bc527b390eed25376e14071fdc3e2aa476225')

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxtask/pull/9
  git apply -3 ../lxtask-transient-dialog.patch

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
