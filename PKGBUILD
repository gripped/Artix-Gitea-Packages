# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Bert Peters <bertptrs@archlinux.org>
# Contributor: Xyne <gro xunilhcra enyx, backwards>
pkgname=reflector
pkgver=2023
pkgrel=5.1
pkgdesc='A Python 3 module and script to retrieve and filter the latest Pacman mirror list.'
arch=(any)
license=(GPL-2.0-only)
url="https://xyne.dev/projects/reflector"
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('rsync: rate rsync mirrors')
backup=(etc/xdg/reflector/reflector.conf)
source=($pkgname-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/reflector/archive/v2023-5.1.tar.gz
        mp-fork.patch)

sha512sums=('2c94e0da795d3bfa80880f335d0b0a3f95cc1c6bee99469b62ca9c54469507a042bdaf8985ddb721ed6a7134c49d9e6c9eee8cffb375386ddf20fb90944b4095'
            '6bbb85a7e829b18ebc7451c38e7ef8ebb9c2d05dac7ab981fc8712b365867faa264eae177a0536a3ad72ffedbf5a6251fed4c6c834879b7e8ada9035ffbdb28e')
b2sums=('00259af48eaa5acca59bceea99c03411cf88946ea5d210afea7970c94fbc8a4bf8d0baf0dde05b05f1e3e710c11fcabc820cae4ba7d207fbb0ba7d54377edc86'
        '37d9980afa27eaf80796d090327c0ce0f78772d4ea8a651bd2fe37af29f002dcff434d9839f930317c4d441cf4236d60ad95676489ae0a22dbe0c37bbae765ef')
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

prepare() {
  cd $pkgname
  patch -p1 < "${srcdir}/mp-fork.patch"
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package ()
{
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 'reflector.conf' "$pkgdir/etc/xdg/reflector/reflector.conf"
}


# vim: set ts=2 sw=2 et:
