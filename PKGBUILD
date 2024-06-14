# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=iniparser
pkgver=4.2.3
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
depends=('glibc')
provides=('libiniparser.so')
makedepends=('cmake' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('b1b9d5e36caf68ed1d5a2eaa14f38c5c')
sha256sums=('6eeba10548b07c054f3cd34eadfd14139e61c37d40dabec988981cc4db2e434e')

build() {
  mkdir build

  cmake \
    "${pkgname}-${pkgver}" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/iniparser/LICENSE
}
