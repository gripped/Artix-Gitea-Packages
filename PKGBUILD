# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libmpdclient
pkgver=2.25
pkgrel=1
pkgdesc="C library to implement a MPD client"
arch=(x86_64)
url="https://www.musicpd.org/libs/libmpdclient/"
license=(BSD-2-Clause BSD-3-Clause)
depends=(glibc)
makedepends=(git meson)
provides=(libmpdclient.so)
source=(git+https://github.com/MusicPlayerDaemon/libmpdclient.git?signed#tag=v${pkgver})
sha512sums=('9ab92e2828944f73ec14f7709b7f3b7c6f8e20d7dbb735e52abbe488053cd10d8e1ce2bcbd841cc0d889abceeca03e8a746200c7b0c1158e9cbe4864f0e64dc3')
b2sums=('933f80a65c3bfc161abb17f71060e1c6f0ab4219266ba1006f86d27310ca12d32185dfe4d4448cf89b6c37388cea57aaa3acf2a5f986f75c771539aee561fe9b')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>

build() {
  artix-meson build $pkgname
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vdm 755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sv /usr/share/doc/$pkgname/BSD-2-Clause.txt "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv /usr/share/doc/$pkgname/BSD-3-Clause.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
