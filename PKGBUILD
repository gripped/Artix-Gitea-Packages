# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.4
pkgrel=1
pkgdesc="A local caching server"
arch=(x86_64)
url="https://github.com/hughsie/passim"
license=(LGPL)
depends=(
  avahi
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
        '0001-no-systemd.patch')
sha512sums=('6e44b19974a7161ba791b32a947a96d684214da5111e37ff3f32b95092d0cca03111f89d6d83547d4d42b90fdfa25a4717188b27953ebfbf443552a050cbe624'
            'SKIP'
            'd51b7f50e8ad15e2c1b1001cd3d200947474a81f5d5f053c5f1f2c344c0246cd3352d5744190889f941aa60afe14f46994fe72b2768ab59a704985b54aeeaaf0')
b2sums=('a932534ceb77bb60882d331b254bce45454f1b84162d0f4762c0e0916d999e01f6f246227775a5c16268a98592e796535f646f68f7da755ec318fd20038ccc9f'
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
  rm "${pkgdir}"/var/lib/passim/data/*
}
