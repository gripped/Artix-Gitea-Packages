# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gkrellm
pkgver=2.3.11
pkgrel=3
pkgdesc="System monitor package for GTK2"
arch=('x86_64')
url="http://gkrellm.srcbox.net/"
license=('GPL3')
depends=('gtk2' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=("${url}/releases/${pkgname}-${pkgver}.tar.bz2"
        )
sha256sums=('1ee0643ed9ed99f88c1504c89d9ccb20780cf29319c904b68e80a8e7c8678c06'
            )

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make LOCALEDIR=/usr/share/locale
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "server/gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
}

# vim:set ts=2 sw=2 et:
