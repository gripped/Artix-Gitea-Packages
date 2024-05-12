# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <f-p@gmx.at>
# Contributor: Xyne <xyne at archlinux dot us>
# Contributor: thiagoc
# Contributor: Chris <chris at christopherjones dot us>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Fabiano Furtado <fusca14 at gmail dot com>

pkgname=fwknop
pkgver=2.6.11
pkgrel=1
pkgdesc='FireWall KNock OPerator: Single Packet Authorization and Port Knocking'
url='https://www.cipherdyne.org/fwknop'
arch=(x86_64)
license=(GPL-2.0-only)
backup=(
  etc/${pkgname}/access.conf
  etc/${pkgname}/fwknopd.conf
)
depends=(
  gpgme
  iptables
  libpcap
  wget
)
source=(
  https://cipherdyne.org/fwknop/download/fwknop-${pkgver}.tar.bz2{,.asc}
)
sha512sums=('79ce0585d075dffe77143b4d6ec3f8653ddad5f46cfb596e9f373be0065bdace7efdfe9cd341ebfaa7232d39f905affa81325b569635c8a44095fd551debadd7'
            'SKIP')
validpgpkeys=('4D6644A9DA036904BDA2CB90E6C9E3350D3E7410') # Michael Rash (Signing key for cipherdyne.org projects) <mbr@cipherdyne.org>

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
