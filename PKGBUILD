# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.1
pkgrel=1
pkgdesc="A local caching server"
arch=(x86_64)
url="https://github.com/hughsie/passim"
license=(LGPL)
depends=(
  glib2 libgio-2.0.so
  gnutls
  hicolor-icon-theme
  libsoup3 libsoup-3.0.so
)
makedepends=(
  cmake
  gobject-introspection
  meson
)
provides=(libpassim.so)
backup=(
  etc/passim.conf
)
source=("https://github.com/hughsie/passim/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
        "0001-no-systemd.patch")
sha512sums=('f35079d3f242430e28d3ef55ade253509ba3bb986a4edde3e2b29f83e915c95564c91badd966969daa4de18e33f01d178a86704fef3c52162097048805be1780'
            'SKIP'
            'd51b7f50e8ad15e2c1b1001cd3d200947474a81f5d5f053c5f1f2c344c0246cd3352d5744190889f941aa60afe14f46994fe72b2768ab59a704985b54aeeaaf0')
b2sums=('acf69c418f00b1c4f64adb56a2b46423b20dbeaa69d2695e78ec959487dd57c3f01d2826e5b2b10c52869709272a09d033826133653775cea14e9bb030d01265'
        'SKIP'
        '950423314a4627517c0c1421b8e605f06c40eb946c20c51e1398dd7cdd4618f310e260f65129db55429ea4c68f447325506ab8d2261a297432ef218e977867b8')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../0001-no-systemd.patch
}

build() {
  artix-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
