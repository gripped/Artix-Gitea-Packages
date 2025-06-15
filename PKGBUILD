# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Bull Schaefer <aaron@elasticdog.com>
# Contributor: Ron Huang <ronhuang+aur at gmail dot com>

pkgname=fcgiwrap
pkgver=1.1.0
pkgrel=10
pkgdesc='A simple server for running CGI applications over FastCGI.'
arch=('x86_64')
url='https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/'
license=('MIT')
depends=('fcgi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnosek/fcgiwrap/archive/${pkgver}.tar.gz"
        'dc0c3b14f0d7bb014a9a4c6c17eb55a123496365.patch'
        "$pkgname-LICENSE::https://raw.githubusercontent.com/gnosek/fcgiwrap/b6696a1495dc818d0b22d9c2e9be7c618e25b3af/COPYING")
sha256sums=('4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f'
            '44342f94e21ba8cb1938c50d9a86bcfaeebb8802b4f5a77d126ddb2387ea2412'
            '1504c301f6d417f2626085337e5c3bb3dc0282265089396ab36bfe1942feef1c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://github.com/gnosek/fcgiwrap/pull/37

  # fix kill() parameters
  patch -Np1 -i ../dc0c3b14f0d7bb014a9a4c6c17eb55a123496365.patch

  autoreconf -vi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # -Werror is not much fun in release builds
  CFLAGS+=' -Wno-error=implicit-fallthrough'

  # Here --sbindir is implicitly prefixed by /usr
  ./configure --prefix=/usr --mandir=/share/man --sbindir=/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm0644 ../$pkgname-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
