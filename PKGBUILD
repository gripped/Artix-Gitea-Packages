# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Radek Podgorny <radek@podgorny.cz>
# Contributor: Dan Anderson <dan-anderson at cox dptnet>

pkgname=mosquitto
pkgver=2.0.17
pkgrel=1
pkgdesc="An Open Source MQTT Broker"
arch=(x86_64)
url="https://mosquitto.org/"
license=(
  EDL-1.0
  EPL-2.0
)
depends=(
  cjson
  gcc-libs
  glibc
  openssl
  util-linux-libs
)
makedepends=(
  c-ares
  cmake
  docbook-xsl
  libwebsockets
  uthash
)
checkdepends=(
  cunit
  python
  python-psutil
)
source=(
  https://mosquitto.org/files/source/mosquitto-$pkgver.tar.gz{,.asc}
  "sysusers_mosquitto.conf"
)
backup=("etc/$pkgname/$pkgname.conf")
sha512sums=('0882380461bf110abe10c5487334b0ae5ce8d890a2ad8f9b419278a0f04fc821918f50408c50c843bf09741eb62d5b9a1ab10df262d46cd70aafc3e063344a9a'
            'SKIP'
            '21848b890c2db258138795ec21a009e022b6a8369217eb31939f976ad434229dd9f61d33e8109ade7bc001e8668e9d42b59c1ab079753860417961e102356f0e')
validpgpkeys=('A0D6EEA1DCAE49A635A3B2F0779B22DFB3E717B7')

prepare() {
  # disable broken tests
  sed '/06-bridge-/d; /08-ssl-connect-cert-auth-expired/d; /08-ssl-connect-cert-auth-revoked/d' -i $pkgname-$pkgver/test/broker/{Makefile,test.py}
  sed '/02-subscribe-qos1/d' -i $pkgname-$pkgver/test/lib/{Makefile,test.py}
  sed '/client test/d' -i $pkgname-$pkgver/test/Makefile
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D WITH_BUNDLED_DEPS=OFF
    -D WITH_SRV=ON
    -D WITH_WEBSOCKETS=ON
    -S $pkgname-$pkgver
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  local plugin client

  # NOTE: tests hardcode all paths... so we copy in place... -_-
  cp -v build/lib/lib* $pkgname-$pkgver/lib/
  cp -v build/lib/cpp/lib* $pkgname-$pkgver/lib/cpp/
  cp -v build/src/$pkgname $pkgname-$pkgver/src/
  for plugin in {dynamic-security,message-timestamp,payload-modification}; do
    cp -v build/plugins/$plugin/*.so $pkgname-$pkgver/plugins/$plugin/
  done
  for client in {pub,rr,sub}; do
    cp -v build/client/${pkgname}_$client $pkgname-$pkgver/client/
  done

  make -C $pkgname-$pkgver/test check
}

package() {
  depends+=(
    c-ares libcares.so
    libwebsockets libwebsockets.so
  )

  DESTDIR="$pkgdir" cmake --install build

  install -vDm 644 $pkgname-$pkgver/edl-v10 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 sysusers_mosquitto.conf "${pkgdir}"/usr/lib/sysusers.d/mosquitto.conf
}
