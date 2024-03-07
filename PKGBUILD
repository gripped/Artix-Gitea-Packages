# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Contributor: Hendrik Meyer <archlinux@t4cc0.re>

pkgname=lsof
pkgver=4.99.3
pkgrel=1
pkgdesc='Lists open files for running Unix processes'
url='https://github.com/lsof-org/lsof'
arch=('x86_64')
license=('custom')
depends=(
  glibc
  libtirpc
)
makedepends=(
  groff
)
source=(https://github.com/lsof-org/lsof/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('86428a8881b0d1147a52058e853c775b83d794f0da685d549b2bfd07063ed1cd')
b2sums=('f2f298d8fe3f03b192984a31bd6b368e08c3ae5b8776625df413b94a0db59258e8aadb8ab4b94b9a3a54803fab463c1b920b524ee0ff512c8cda4b88e89b4c50')

build() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --enable-security \
    --enable-no-sock-security \
    --with-libtirpc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
