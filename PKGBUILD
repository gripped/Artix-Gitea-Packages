# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel
pkgver=3.54.0
pkgrel=1
pkgdesc='Panel of GNOME Flashback'
arch=(x86_64)
url='https://wiki.gnome.org/Projects/GnomePanel'
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  at-spi2-core
  cairo
  dconf
  evolution-data-server
  gdk-pixbuf2
  geocode-glib-2
  glib2
  glibc
  gnome-desktop
  gnome-menus
  gsettings-desktop-schemas
  gtk3
  hicolor-icon-theme
  libgdm
  libgweather-4
  libical
  libwnck3
  libx11
  libxrandr
  nautilus
  pango
  polkit
 
)
makedepends=(
  autoconf-archive
  git
  glib2-devel
  yelp-tools
)
optdepends=(
  'alacarte: Main menu editor'
  'gnome-applets: Extra applets for the panel'
)
source=(
        '0001-build-remove-systemd-dependency-and-code.patch'
  "git+https://gitlab.gnome.org/GNOME/$pkgname.git?signed#tag=$pkgver"
  gnome-panel-60.patch
  gnome-panel-64.patch
  gnome-panel-65.patch
  gnome-panel-75.patch
)
b2sums=('064a73442407f16d4676099472a129e3d7fbda31b5963631656a667c40b928e9b41f55e5b9c2f2cec0963806d9a12dbda7e1c75a56d751ba2944b9df011560b8'
        'ba7e7fefdf56b6506b2be8804b8b0503752711f9fe8e2ed5de86ee0d5fdcce83141ddabb7e032ffd61050d16a91fa0ec2cc343ce8c349959844f83c6114d1b58'
        '22210d4e94c5279336014d0969a1059b5fa7c825f56a50c2741b50499be4af81fa165eda04ab8ee8f96a3f440c88c8a6416cb0468e82f684fe7b902bbe057735'
        '4dd8d54490d500e2c9775908d6b6f8d07843fe6d2721de17befa22e62bd821910af42de8bcf2a356582186e2050449710c0866456c7ec11f0319aef78868eab2'
        '386e17afb7575d87bc1caa5cb59505967367308454270747ebf5d30747cbcf981250d33bf53c559e39311e530571d8e981532992b884bf772b92d8977557a1fb'
        'ca26d20daa8a817b9f138b4c5e2700f56a0b67ebe7c49474a9629343b2da10e32e381edbb8d30656d0b2696861e53451a8927c0c3895f46aa49acfd4947cd7b5')
validpgpkeys=(7B44FD78E49334EC10B3B288A3D013EC303E1894) # Alberts Muktupāvels <alberts.muktupavels@gmail.com>

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/gnome-panel/-/merge_requests/60
  git apply -3 ../gnome-panel-60.patch

  # https://gitlab.gnome.org/GNOME/gnome-panel/-/merge_requests/64
  git apply -3 ../gnome-panel-64.patch

  # https://gitlab.gnome.org/GNOME/gnome-panel/-/merge_requests/65
  git apply -3 ../gnome-panel-65.patch

  # https://gitlab.gnome.org/GNOME/gnome-panel/-/merge_requests/75
  git apply -3 ../gnome-panel-75.patch

  # Reduce panel icon spacing
  sed -i '/"panel-icon-spacing"/{n;n;s/>2</>1</}' data/org.gnome.gnome-panel.gschema.xml

  git apply -3 ../0001-build-remove-systemd-dependency-and-code.patch
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --enable-compile-warnings
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
