# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=net-snmp
pkgver=5.9.5
pkgrel=1
pkgdesc='A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6'
arch=('x86_64')
url='http://www.net-snmp.org/'
license=('BSD')
depends=('libnsl' 'libpcap' 'lm_sensors' 'openssl' 'pciutils' 'pcre2' 'perl')
makedepends=('git' 'python-setuptools')
optdepends=('perl-term-readkey: for snmpcheck application'
            'perl-tk: for snmpcheck and tkmib applications'
            'python: for the python modules')
provides=('libnetsnmpagent.so'
          'libnetsnmphelpers.so'
          'libnetsnmpmibs.so'
          'libnetsnmp.so'
          'libnetsnmptrapd.so'
          'libsnmp.so')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/net-snmp/net-snmp.git#tag=v${pkgver}")
sha512sums=('66d35d6d4ba06b101987145c0ff3addf0a861e64ec562874d9df7b64cda9cb68787bdbc39c485ee8065a1652414c47217bcf852ef1db947a6498b530c153ddb1')
validpgpkeys=('27CAA4A32E371383A33ED0587D5F9576E0F81533'
              '6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB'
              '8AAA779B597B405BBC329B6376CF47B8A77C5329'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

_backports=(
)

_reverts=(
)

prepare() {
  cd "${pkgname}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  autoreconf -i
}

build() {
  cd "${pkgname}"

  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --sbindir='/usr/bin' \
    --mandir='/usr/share/man' \
    --enable-blumenthal-aes \
    --enable-ipv6 \
    --enable-ucd-snmp-compatibility \
    --with-python-modules \
    --with-default-snmp-version='3' \
    --with-sys-contact='root@localhost' \
    --with-sys-location='Unknown' \
    --with-logfile='/var/log/snmpd.log' \
    --with-mib-modules='host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod ucd-snmp/lmsensorsMib' \
    --with-persistent-directory='/var/net-snmp'
  make NETSNMP_DONT_CHECK_VERSION=1
}

package() {
  cd "${pkgname}"

  sed -i -e "s:install --basedir=\$\$dir:install --basedir=\$\$dir --root=${pkgdir}:" Makefile
  make DESTDIR="${pkgdir}" INSTALL_PREFIX="${pkgdir}" INSTALLDIRS=vendor install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
