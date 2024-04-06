# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=net-snmp
pkgver=5.9.4
pkgrel=3
pkgdesc="A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6"
arch=('x86_64')
url="http://www.net-snmp.org/"
license=('BSD')
depends=('libnsl' 'libpcap' 'lm_sensors' 'openssl' 'pciutils' 'pcre2' 'perl')
makedepends=('python-setuptools')
optdepends=('perl-term-readkey: for snmpcheck application'
            'perl-tk: for snmpcheck and tkmib applications'
            'python: for the python modules')
options=('!emptydirs' '!makeflags')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc}
        0001-pcre2.patch)
sha512sums=('a510fa91a21e9ddc86a12fd1d0bc6b356e63f3ea53f184d2e31439004d41d902390664134dc40b3b828eabb4282eaf3da628a07c4d480fa00eff7e700950c423'
            'SKIP'
            '16234f8bb66f6754d3b61752c2fd479676e504281e9857c72b44d99444aa95bb03263d0d93d1b9996daf760ed78344dcdcc7ab1f701dce9a5b51c7c7158a8f9d')
validpgpkeys=('27CAA4A32E371383A33ED0587D5F9576E0F81533'
              '6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB'
              '8AAA779B597B405BBC329B6376CF47B8A77C5329'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../0001-pcre2.patch
  autoreconf -i
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --enable-blumenthal-aes \
    --enable-ipv6 \
    --enable-ucd-snmp-compatibility \
    --with-python-modules \
    --with-default-snmp-version="3" \
    --with-sys-contact="root@localhost" \
    --with-sys-location="Unknown" \
    --with-logfile="/var/log/snmpd.log" \
    --with-mib-modules="host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod ucd-snmp/lmsensorsMib" \
    --with-persistent-directory="/var/net-snmp"
  make NETSNMP_DONT_CHECK_VERSION=1
}

package() {
  cd ${pkgname}-${pkgver}
  sed -i -e "s:install --basedir=\$\$dir:install --basedir=\$\$dir --root=${pkgdir}:" Makefile
  make DESTDIR="${pkgdir}" INSTALL_PREFIX="${pkgdir}" INSTALLDIRS=vendor install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
