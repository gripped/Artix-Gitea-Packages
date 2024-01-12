# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=net-snmp
pkgver=5.9.2
pkgrel=2
pkgdesc="A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6"
arch=('x86_64')
url="http://www.net-snmp.org/"
license=('BSD')
depends=('libnsl' 'libpcap' 'lm_sensors' 'pciutils' 'pcre' 'perl')
makedepends=('python-setuptools')
optdepends=('perl-term-readkey: for snmpcheck application'
            'perl-tk: for snmpcheck and tkmib applications'
            'python: for the python modules')
options=('!emptydirs' '!makeflags')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('d67810b15c4956a28ccb4d9a3870604bc94e71247d9a8d3a9959041268122b3500cf68a7912cfb01a6cff27f3f4364cbd106629ab80c12974f694b6c548bde59'
            'SKIP')
validpgpkeys=('8AAA779B597B405BBC329B6376CF47B8A77C5329'
              '27CAA4A32E371383A33ED0587D5F9576E0F81533'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -i
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --enable-ucd-snmp-compatibility \
    --enable-ipv6 \
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
