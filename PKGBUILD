# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=syslog-ng
pkgver=4.8.0
pkgrel=1
pkgdesc="Next-generation syslogd with advanced networking and filtering capabilities"
arch=(x86_64)
url="https://github.com/syslog-ng/syslog-ng"
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(
  abseil-cpp
  bash
  curl
  gawk
  gcc-libs
  glib2
  glibc
  grpc
  json-c
  libcap
  libnet
  openssl
  pcre2
  protobuf
 
)
makedepends=(
  hiredis
  libdbi
  libesmtp
  libmaxminddb
  librabbitmq-c
  librdkafka
  libxslt
  mongo-c-driver
  net-snmp
  python
  python-boto3
  python-botocore
  python-cachetools
  python-certifi
  python-charset-normalizer
  python-dateutil
  python-google-auth
  python-idna
  python-kubernetes
  python-oauthlib
  python-ply
  python-pyasn1
  python-pyasn1-modules
  python-pyyaml
  python-requests
  python-requests-oauthlib
  python-rsa
  python-setuptools
  python-six
  python-urllib3
  python-websocket-client
 
)
checkdepends=(
  criterion
  python-pytest
  python-pytest-mock
)
optdepends=(
  'hiredis: for the Redis plugin'
  'libdbi: for the SQL plugin'
  'libesmtp: for the SMTP plugin'
  'libmaxminddb: for the GeoIP2 plugin'
  'librabbitmq-c: for the AMQP plugin'
  'librdkafka: for the Kafka C plugin'
  'logrotate: for rotating log files'
  'mongo-c-driver: for the MongoDB plugin'
  'net-snmp: for the SNMP plugin'
  'python-boto3: for Python S3 module'
  'python-botocore: for Python S3 module'
  'python-kubernetes: for Python Kubernetes module'
  'python-ply: for debugger CLI'
  'python-requests: for Python hypr module'
  'python: for Python-based plugins'
)
conflicts=(eventlog)
replaces=(eventlog)
backup=(
  "etc/$pkgname/$pkgname.conf"
  "etc/logrotate.d/$pkgname"
  "etc/default/$pkgname@default"
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname.logrotate"
  "$pkgname-do-not-install-python-venv.patch"
  "$pkgname-config.patch"
)
sha256sums=('f2035546af5fcc0c03a8d03f5f0e929ce19131a428d611c982a5fea608a5d9d6'
            '93c935eca56854011ea9e353b7a1da662ad40b2e8452954c5b4b5a1d5b2d5317'
            '7ca7f0d9fb203b3814fe2f609904af84df346b84591eeeb171bb2e5eb6393990'
            '423391cd5cc2f73cecd4d0191711f89c24ff178c5bff8e78ff9bfd3d246b0f74')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/$pkgname-do-not-install-python-venv.patch" # Don't install Python venv using pip.
  patch -Np1 -i "$srcdir/$pkgname-config.patch"                     # Add further distribution examples, disable default log file.

  # Remove tests failing in a chroot but not on host. Not sure why.
  sed -i '/include lib\/secret-storage\/tests\/Makefile.am/d' lib/secret-storage/Makefile.am
  rm -r lib/secret-storage/tests

  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  local configure_options=(
    --datadir=/usr/share
    --disable-java
    --disable-java-modules
    --disable-mqtt
    --disable-riemann
    --enable-all-modules
    --enable-ipv6
    --enable-manpages
    --enable-spoof-source
    --disable-systemd
    --libexecdir=/usr/lib
    --localstatedir="/var/lib/$pkgname"
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir="/etc/$pkgname"
    --with-jsonc=system
    --with-pidfile-dir=/run
    --with-python-packages=system
    --with-systemdsystemunitdir=no
  )
  ./configure "${configure_options[@]}"

  # Prevent excessive overlinking due to libtool.
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vdm755 "$pkgdir/var/lib/$pkgname"
  install -vDm644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
}
