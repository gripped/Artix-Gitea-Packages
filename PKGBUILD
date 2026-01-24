# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=squid
pkgver=7.4
pkgrel=1
pkgdesc='Full-featured Web proxy cache server'
arch=('x86_64')
url='http://www.squid-cache.org'
depends=('openssl' 'pam' 'perl' 'libltdl' 'libcap' 'nettle' 'gnutls' 'libnsl' 'libxml2'
	'tdb')
makedepends=('krb5' 'libldap')
optdepends=('libldap')
license=('GPL')
options=('emptydirs')
backup=('etc/squid/squid.conf'
	'etc/squid/cachemgr.conf'
	'etc/squid/errorpage.css'
	'etc/squid/mime.conf')
validpgpkeys=('EA31CC5E9488E5168D2DCC5EB268E706FF5CF463'
	      'B06884EDB779C89B044E64E3CD6DBF8EF3B17D3E'
	      '29B4B1F7CE03D1B1DED22F3028F85029FEF6E865')
source=("https://github.com/squid-cache/squid/releases/download/SQUID_${pkgver/./_}/squid-$pkgver.tar.xz"
        "https://github.com/squid-cache/squid/releases/download/SQUID_${pkgver/./_}/squid-$pkgver.tar.xz.asc"
        'squid.pam'
        'squid.tmpfiles'
        'squid.sysusers')
sha256sums=('e31976edd755c295bd5842a349c9c7dad16a683d066337cc09033c1302b4fed4'
            'SKIP'
            '11fb388f8679fd6461e0de006810ea608a3686fffda16904b0ed71f412be499c'
            '495f54e51f6ec1e4dce87090d76718aea1eb37559c4439d876dd39598163062a'
            'b13c6c17ba8d24fa9414ba3c0aa92863dccce720930a0dd53acc1c0e32041e5a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  for p in ${source[@]}; do
    test "${p:(-5)}" == "patch" && patch -p1 -i ../${p:(-46)} || true
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --datadir=/usr/share/squid \
    --sysconfdir=/etc/squid \
    --libexecdir=/usr/lib/squid \
    --localstatedir=/var \
    --with-logdir=/var/log/squid \
    --with-pidfile=/run/squid.pid \
    --enable-auth \
    --enable-auth-basic \
    --enable-auth-ntlm \
    --enable-auth-digest \
    --enable-auth-negotiate \
    --enable-removal-policies="lru,heap" \
    --enable-storeio="aufs,ufs,diskd,rock" \
    --enable-delay-pools \
    --enable-arp-acl \
    --with-openssl \
    --enable-snmp \
    --enable-linux-netfilter \
    --enable-ident-lookups \
    --enable-useragent-log \
    --enable-cache-digests \
    --enable-referer-log \
    --enable-arp-acl \
    --enable-htcp \
    --enable-carp \
    --enable-epoll \
    --with-large-files \
    --enable-arp-acl \
    --with-default-user=proxy \
    --enable-async-io \
    --enable-truncate \
    --enable-icap-client \
    --enable-ssl-crtd \
    --disable-arch-native \
    --disable-strict-error-checking \
    --enable-wccpv2
  make
}

package() {
  cd "$srcdir"

  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install

  chmod 07755 "$pkgdir"/usr/lib/squid/basic_pam_auth
  
  install -Dm644 "$srcdir/squid.pam" "$pkgdir/usr/lib/pam.d/squid"
  install -Dm644 "$srcdir/squid.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/squid.conf"
  install -Dm644 "$srcdir/squid.sysusers" "$pkgdir/usr/lib/sysusers.d/squid.conf"
  rm -rf "$pkgdir/run" "$pkgdir"/var/{cache,log,run}
}

# vim: ts=2 sw=2 et ft=sh
