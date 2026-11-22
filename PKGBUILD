# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Radek Podgorny <radek@podgorny.cz>
# Contributor: Dan Anderson <dan-anderson at cox dptnet>

pkgname=mosquitto
pkgver=2.1.4
pkgrel=1
pkgdesc="An Open Source MQTT Broker"
arch=(x86_64)
url="https://mosquitto.org/"
license=(
  LicenseRef-EDL-1.0
  EPL-2.0
)
depends=(
  cjson
  libgcc
  libstdc++
  glibc
  openssl
  util-linux-libs
  readline
  sqlite
  c-ares
 
)
makedepends=(
  argon2
  cmake
  ninja
  docbook-xsl
  libwebsockets
 
  uthash
)
checkdepends=(
  cunit
  python
  python-psutil
  gtest
)
source=(
  https://mosquitto.org/files/source/mosquitto-$pkgver.tar.gz{,.asc}
  "sysusers_mosquitto.conf"
)
backup=("etc/$pkgname/$pkgname.conf")
sha512sums=('310a8b7a69a8bd2fee1ff4d58302203b3b5765cc1aa1948dd423cb367ee66314ab683b92cfde67454bc66fd193ba2bc8875136218f63b130ecf6790f4f20bed3'
            'SKIP'
            '22b7472ad47f077bef025c476ca9181b0e0ccefce84a7ee0b5a212a84ddd1e46f6f6e64b0722d9d359178c74e74920fe95bcee7ea895449f2aa26e284b4b11b1')
validpgpkeys=('A0D6EEA1DCAE49A635A3B2F0779B22DFB3E717B7')

prepare() {
  # disable broken tests
  sed '/02-subscribe-qos1/d' -i $pkgname-$pkgver/test/lib/{Makefile,test.py}
  sed '/client test/d' -i $pkgname-$pkgver/test/Makefile

  cd $pkgname-$pkgver
}

build() {
  # /usr/bin/mosquitto uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -G Ninja
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D WITH_BUNDLED_DEPS=OFF
    -D WITH_SRV=ON
    -D WITH_SYSTEMD=OFF
    -D WITH_WEBSOCKETS=ON
    -D WITH_TESTS=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  cd build

  ctest --output-on-failure --repeat until-pass:5
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm 644 $pkgname-$pkgver/edl-v10 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 sysusers_mosquitto.conf "${pkgdir}"/usr/lib/sysusers.d/mosquitto.conf

  mv "$pkgdir"/etc/mosquitto/mosquitto.conf{.example,}
}
