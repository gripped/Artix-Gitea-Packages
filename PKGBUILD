# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.7
pkgrel=1.1
pkgdesc="A local caching server"
arch=(x86_64)
url="https://github.com/hughsie/passim"
license=(LGPL-2.1-or-later)
depends=(
  avahi
  glib2 libgio-2.0.so
  gnutls
  hicolor-icon-theme
  libsoup3 libsoup-3.0.so
)
makedepends=(
  cmake
  git
  gobject-introspection
  meson
)
provides=(libpassim.so)
backup=(
  etc/passim.conf
)
source=("git+https://github.com/hughsie/passim.git#tag=${pkgver}?signed"
        '0001-no-systemd.patch')
sha512sums=('11ae911c20e90a4ae135fc71a58563b904dd9fb1a777a0cfa0cd5374d77526c7fd71baf67b74d1316a3e9e49bdba2c2e2b537fb4dbe0ff17d5193bfaae80ddd1'
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('4efdb32de4e27c0619696a0425b52693bc153d40857a161168a8f3732edff6ad13bd230a7e213244effa0c2ff7dd07dc1e3592042e50c988d9eaec46f3db4f26'
        'f6d90013cb56f9707d95788d888baeeb9a11a75ded9cb1cda8c68870a7a0fbc8142b55e4570ea51556be484a56b8dc2a6384eee58e3ab2ba7a737888b3ca1d63')
validpgpkeys=(163EB50119225DB3DF8F49EA17ACBA8DFA970E17) # Richard Hughes <richard@hughsie.com>


prepare() {
  patch -Np1 -d $pkgname -i ../0001-no-systemd.patch
}

build() {
  artix-meson ${pkgname} build  -D sysusersdir=/usr/lib/sysusers.d
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm "${pkgdir}"/var/lib/passim/data/*
}
