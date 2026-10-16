# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ondřej Surý <ondrej@sury.org>
# Contributor: Julian Brost <julian@0x4a42.net>
# Contributor: Oleander Reis <oleander@oleander.cc>
# Contributor: Otto Sabart <seberm[at]gmail[dot]com>

pkgname=knot
pkgver=3.6.1
pkgrel=1
pkgdesc="High-performance authoritative-only DNS server"
arch=(x86_64)
url="https://www.knot-dns.cz/"
license=(GPL-3.0-or-later)
depends=(
  fstrm
  glibc
  gnutls
  libbpf
  libcap-ng
  libedit
  libgcc
  libidn2
  libmaxminddb
  libmnl
  libnghttp2
  libngtcp2
  liburcu
  libxdp
  lmdb
  protobuf-c
 
)
makedepends=(
  git
  python-sphinx
)
backup=('etc/knot/knot.conf')
source=("git+https://gitlab.nic.cz/knot/knot-dns.git#tag=v${pkgver}?signed")
b2sums=('4739e93565d1508bf1316cf568c1b0f7de241ed3bd7595debba682d25403d41a91548f5d2c78c5ffd5cc06163eef717f5dcf1b0735d663f998b80899c9d7070f')
validpgpkeys=(742FA4E95829B6C5EAC6B85710BB7AF6FEBBD6AB) # Daniel Salzman <daniel.salzman@nic.cz>

prepare() {
  cd ${pkgname}-dns
  # https://archlinux.org/todo/change-sysusers-to-fully-locked-system-accounts/
  sed -i 's/^u /u! /' distro/common/knot.sysusers

  autoreconf -fiv
}

build() {
  cd ${pkgname}-dns
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --libexecdir=/usr/lib/knot \
    --with-rundir=/run/knot \
    --with-storage=/var/lib/knot \
    --enable-dnstap \
    --enable-quic \
    --disable-silent-rules
  make
}

check() {
  cd ${pkgname}-dns
  make check
}

package() {
  cd ${pkgname}-dns
  make DESTDIR="${pkgdir}" install

  # Don’t keep those empty dir, manage them with-tmpfiles instead
  rmdir -v "${pkgdir}"/{var/{lib/{knot/,},},run/{knot/,}}

  rm -v "${pkgdir}"/etc/knot/example.com.zone
  mv -v "${pkgdir}"/etc/knot/{knot.sample.conf,knot.conf}

  install -vDm644 distro/common/knot.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -vDm644 distro/common/knot.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
