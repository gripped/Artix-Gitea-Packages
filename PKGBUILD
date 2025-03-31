# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Steven <steven at stebalien dot com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=knockd
pkgver=0.8
pkgrel=1.1
pkgdesc="A simple port-knocking daemon"
url="http://www.zeroflux.org/projects/knock"
downurl="https://github.com/jvinet/knock/archive/refs/tags"
arch=('x86_64')
license=('GPL2')
depends=('libpcap>=1.0.0')
backup=('etc/knockd.conf')
source=(${pkgname}-${pkgver}.tar.gz::$downurl/v${pkgver}.tar.gz
        knockd.logrotate
        limits.h.patch)
sha512sums=('bc6fcbfd9cab2cace35e08b90fd211b739357bc56f53a29bd7dbd745441b5cec2f91bbbe293d8efdd383f75a902f7375a20e758f535142305faaabd4f44dda9c'
            '3ea2ae9392d3d79bb5df6b75090f6c1a9548979e01dcd4a75471cfa46dbc70401a166496b5158f90fc61326a554acacc38f8605aab02b5b53b75d60a7d80648a'
            '5776b8670aa439e77d5ac873b63dd5e4d4b5bfb8f1e8fbf49c7d0c3c8f97e47dca761ef1374b742182b0d9928dba4b719442c5f01ca29249a6aa6da6cbf283ed')

prepare() {
  cd knock-${pkgver}
  patch -Np0 < "${srcdir}/limits.h.patch"
}

build() {
  cd knock-${pkgver}
  autoreconf -fi
  ./configure --prefix=/usr --sbin=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd knock-${pkgver}
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man install
  install -Dm 644 "${srcdir}/knockd.logrotate" "${pkgdir}/etc/logrotate.d/knockd"
  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
