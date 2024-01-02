# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.5
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
sha512sums=('005e031911270a0c5851f7d5fa2ec9f3f0cc832a6ce3c4e13203303aa8677875ff347d0a52b989e1d348b6706ae6d94a253ecb22482be791d64ef9a08453a503'
            'SKIP'
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('a7c422c31de6a6dd016572c0297ee424df35befaae3da44b144ffcd6985942dba812e336a7486eb1cdcc5534badce6725cbb7868f59c5bcb089ea6c93a18be38'
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
