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
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('a932534ceb77bb60882d331b254bce45454f1b84162d0f4762c0e0916d999e01f6f246227775a5c16268a98592e796535f646f68f7da755ec318fd20038ccc9f'
        'SKIP'
        'f6d90013cb56f9707d95788d888baeeb9a11a75ded9cb1cda8c68870a7a0fbc8142b55e4570ea51556be484a56b8dc2a6384eee58e3ab2ba7a737888b3ca1d63')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../0001-no-systemd.patch
}

build() {
  artix-meson ${pkgname}-${pkgver} build  -D sysusersdir=/usr/lib/sysusers.d
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm "${pkgdir}"/var/lib/passim/data/*
}
