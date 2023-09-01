# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.2.1
pkgrel=3
pkgdesc="Kolab XML Format Schema Definitions Library"
url='https://www.kolab.org/'
arch=('x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'swig')
source=(http://deb.debian.org/debian/pool/main/libk/libkolabxml/libkolabxml_$pkgver.orig.tar.gz
#https://cgit.kolab.org/libkolabxml/snapshot/libkolabxml-libkolabxml-$pkgver.tar.gz
)
sha512sums=('61615a433f805705eeb74436fad728b2d232215d4a274b63b8db4a0e5d6e9c2ccc2fc71205d673a9e33a16a75f24a65c7f44619f9cc8c0879ebfb5bc65c2b404')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DBoost_NO_BOOST_CMAKE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
