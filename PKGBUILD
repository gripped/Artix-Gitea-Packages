# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

pkgname=onetbb
pkgver=2021.11.0
pkgrel=2
pkgdesc='High level abstract threading library (oneAPI Threading Building Blocks)'
arch=('x86_64')
url='https://oneapi-src.github.io/oneTBB/'
license=('Apache')
depends=('gcc-libs' 'hwloc')
makedepends=('cmake' 'inetutils' 'ninja' 'python' 'swig' 'python-setuptools')
conflicts=('intel-tbb' 'tbb')
provides=("intel-tbb=$pkgver" "tbb=$pkgver")
replaces=('intel-tbb' 'tbb')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('4779141b7602f2fa3a509fdd346824ba270a3a568df3649ce8cb51264d233df5cec5e5cb67b91319dd11d3d5e054697b4ed345e07216107985ddb6e1e7ef94e5')

build() {
  cmake -B build -S oneTBB-$pkgver -GNinja \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DTBB_STRICT=OFF \
          -DTBB4PY_BUILD=ON \
          -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

check() {
  cd build
  ninja test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/lib/python*
  cd oneTBB-$pkgver/python
  TBBROOT="$pkgdir"/usr python setup.py install --root="$pkgdir"
}
