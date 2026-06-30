# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=opensips
pkgver=4.0.0
pkgrel=1.1
pkgdesc="An Open Source SIP Server able to act as a SIP proxy, registrar, location server, redirect server ..."
url="https://www.opensips.org"
depends=()
makedepends=('libldap' 'libmariadbclient' 'libmicrohttpd' 'libxml2' 'libxslt'
             'lynx' 'openssl' 'postgresql-libs' 'unixodbc' 'git')
optdepends=('curl: db_http module'
            'libldap: ldap module'
            'libmicrohttpd: httpd module'
            'libxml2: presence module'
            'mariadb-libs: db_mysql module'
            'openssl: tls_openssl module'
            'postgresql-libs'
            'unixodbc: db_unixodbc module')
backup=("etc/opensips/opensips.cfg"
	"etc/opensips/osipsconsolerc"
	"etc/opensips/opensipsctlrc")
arch=('x86_64')
license=('GPL-2.0-only')
options=('!emptydirs' '!makeflags')
#source=(https://opensips.org/pub/opensips/${pkgver}/opensips-${pkgver}.tar.gz)
source=("git+https://github.com/OpenSIPS/opensips.git#tag=$pkgver")
sha256sums=('f6fcc950e6e0b486e6c1617dcd380bad7bfc2488cd00053df6ecadb386869483')

_modules="db_http db_mysql db_postgres db_unixodbc h350 httpd ldap presence presence_xml proto_tls tls_mgm tls_openssl tm rr"

build() {
  cd "$srcdir"/$pkgname/

  make \
	include_modules="${_modules}" bin_dir=bin/ cfg_target=/etc/$pkgname/ \
	LIBDIR=lib PREFIX=/usr
}

package() {
  cd "$srcdir"/$pkgname/

  make \
	include_modules="${_modules}" bin_dir=bin/ cfg_target=/etc/$pkgname/ cfg_prefix="$pkgdir" \
	BASEDIR="$pkgdir" PREFIX=/usr LIBDIR=lib install

}
