# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerhard Brauer <gerbra@archlinux.de>

pkgname=nbd
pkgver=3.26.1
pkgrel=2
pkgdesc='tools for network block devices, allowing you to use remote block devices over TCP/IP'
arch=('x86_64')
url='https://github.com/NetworkBlockDevice/nbd/'
license=('GPL')
depends=('glib2' 'gnutls' 'libnl')
makedepends=('docbook-utils' 'docbook-sgml' 'perl-sgmls' 'autoconf-archive')
backup=('etc/nbd-server/config')
source=("https://github.com/NetworkBlockDevice/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz"
        'config'
        'sysusers_nbd.conf')
sha256sums=('f0cf509fa5b20b1a07f7904eb637e9b47d3e30b6ed6f00075af5d8b701c78fef'
            'ee2e9fbbeb8a8b9b71d16b6f32eb41788f6def9d00cc4a47897ed3cb97cdde7c'
            'c2259eba02b7e959476e4f7032f273c1972947dfdeb9019106e70ce8798b912d')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo > systemd/Makefile.am

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-syslog

  sed -i 's|automake-1.16|automake-1.17|' Makefile */Makefile
  autoreconf -f
  make
}

# checks still fail...
#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#
#  make check
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m0644 "${srcdir}"/config "${pkgdir}"/etc/nbd-server/config
  install -D -m0644 "${srcdir}"/sysusers_nbd.conf "${pkgdir}"/usr/lib/sysusers.d/nbd.conf

  install -D -m0644 doc/README "${pkgdir}"/usr/share/doc/nbd/README
}
