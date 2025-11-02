# Maintainer: nous at artixlinux
# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Marcus Schulderinsky <mmaacceess at gmail dot com>

_pkgname=lxmusic
pkgname=$_pkgname-gtk2
pkgver=0.4.8
pkgrel=1.1
pkgdesc='Lightweight music player (XMMS2 client), GTK2 version'
arch=('x86_64')
url='https://lxde.org/'
license=('GPL2')
groups=('lxde-gtk2')
depends=(
  gdk-pixbuf2
  glib2
  glibc
  gtk2
  hicolor-icon-theme
  libnotify
  xmms2
)
makedepends=('git' 'intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(
  "git+https://github.com/lxde/lxmusic.git#tag=$pkgver"
  lxmusic.appdata.xml
  lxmusic-transient-dialog.patch
  lxmusic-no-systray.patch
)
b2sums=(
  4ef3555677a61a09677eb3ef3c11fd59d60ad078afb044cdf902b3baecc680c51ed9a1edb651de6e453efacb3d84d354c05a0c2b6cbedac7430beee847d3d7df
  20b37ccf69a2d6d427ab9d075132356dd77ed065be0d8f8c2e4a82ec10c5bd4d56bb7b746e976446ce87f39c79526eeb14a2d86d26f65d9927b9c61cdbaf00e4
  3d8e1eba55e6542fe1ce4df2861c0bd911a21e76ca4a8143b1124859d559fb4daa85c5ca99632c3beaa89accdc169f9c05a74950b7208e137241230ca91c2172
  f50362118aad683c0d1a97e72508a7d3327f5c4db2865257be1dd7f633f24615af05fb53d8e1f24eaef0a68cc2eb30015f285a51441feabce0818cd4659ac382
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxmusic/pull/5
  git apply -3 ../lxmusic-transient-dialog.patch

  # https://github.com/lxde/lxmusic/pull/6
  git apply -3 ../lxmusic-no-systray.patch

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
