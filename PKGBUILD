# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.13
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
sha512sums=('e6af7d0f1e0833ff833bc1d5bb97fb272d917abbc5c395e0d1486e0eda64f182bb9073f4c65839f40e88df8d2178a8a9e4920cb20990fe6198ae64b04f9c6ba5'
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('0769e13dfae18fd9bf2b699d31dc92feb4469498b1846dd1014d1ebc9c1dc6aeea521dc38a9f19a7afe11f078d7e7ed62f9e1c836c3319c63a2f8824f5f745e0'
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
