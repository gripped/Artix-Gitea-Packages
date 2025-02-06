# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.9
pkgrel=1
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
sha512sums=('9b2c8ea5ddfe129544b77248bb099a6cf2bee13327dc89313b4a627df9eabae79b3443698b5764803d0b12cebbc25019110e412624dcb8c342f1923d6deaa699'
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('edd0b59fb2d1b2f410648e24146c6db6fa4c8245140af9a659b2f57130c92dc9353a7b42dea8c184d941e564a7cb17e14c26418389b67e0cce79fc388d8b7783'
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
