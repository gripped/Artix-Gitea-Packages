# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=passim
pkgver=0.1.6
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
sha512sums=('284c646cfb56fd13c672640b3c12167c50cf0fec841f1410ad3fb86fea34c5431214e81715d732e873db03a2127d6e1193ccfc8183f3642743f3a35254229398'
            'SKIP'
            '5d7c69dc33099c0a6db76eb213dedf50a8dc22b3f8b677a1d4c1b9d856e63f5b665c19bb5803bd13038d342c3334ee1992f393ecaddd5d83406cd9f5ef8012ed')
b2sums=('4c979d4a5b35e8c5d972de71fb963300523c578608034b93987ce1f84866de1d2f9a72e22da9407025e1273800f190845c219c5a39ac2f4ad9b9059f75c9f516'
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
