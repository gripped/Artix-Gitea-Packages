# Maintainer: nous
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

_pkgname=pcmanfm
pkgname=$_pkgname-gtk2
pkgver=1.4.0
pkgrel=1
pkgdesc='Extremely fast and lightweight file manager, GTK2 version'
arch=('x86_64')
url='https://lxde.org/'
license=('GPL')
groups=('lxde-gtk2')
depends=('libfm-gtk2' 'lxmenu-data')
depends=(
  at-spi2-core
  cairo
  gdk-pixbuf2
  glib2
  gtk2
  libfm
  libfm-gtk2
  libx11
  lxmenu-data
  pango
)
makedepends=('git' 'intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'xarchiver-gtk2: archive management')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/pcmanfm.git#tag=$pkgver"
  pcmanfm.appdata.xml
  pcmanfm-transient-dialog.patch
  pcmanfm-desktop-onlyshowin.patch
)
b2sums=(
  5793db3e6c6c5959a9e7d3923f723c5197fb513f15005d1a709c9c572e3d0af98073d2ce927f9d1198603233ebd7c918504b8fb9878640fd70550dfdf04f8dfd
  4372dadab89cfa22bcc6572149d24afbc53efb5020544266372c69263991a238b0f32f515ee261cf07562ca8abe70df47c2d060f6e6f98bd405e4530f0ab5155
  aa3c1cc99e85169f03c7222ad2fb4e2da355f9e9e0d2bf1bb0fe3dec889f54817be7b805c519347cc528296d4c6d6815c0f7f5a8620d920437e6545b47bab0b2
  f8bee16ce19c945d350a77978a2893407a8b1dcc174623aaad33fa8cb1c5b8fc177127c56522e60850bce58e27cab39a5453f6d7a7ee8d783e3122801123c0cd
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/pcmanfm/pull/32
  git apply -3 ../pcmanfm-transient-dialog.patch

  # https://github.com/lxde/pcmanfm/pull/34
  git apply -3 ../pcmanfm-desktop-onlyshowin.patch

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
