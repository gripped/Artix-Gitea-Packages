# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=faad2
pkgver=2.11.0
pkgrel=1
pkgdesc="Freeware Advanced Audio (AAC) Decoder"
arch=(x86_64)
url="https://github.com/knik0/faad2"
license=(GPL-2.0-or-later)
depends=(glibc)
makedepends=(cmake)
provides=(
  faad
  libfaad_drm.so
  libfaad.so
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
  $pkgname-2.11.0-build_shared_libs.patch::https://github.com/knik0/faad2/commit/92ce281311f629faa99c9e06baaf41977f431f1b.patch
)
sha512sums=('b85aab9b2d2afdca7096c999bcb7fabfccce4781760d9eb14d23fdd38691729927b09464708abf49a751e70c4475151ca14c5a7419b5cf4d9ec70c433dc86282'
            '5c427ef8568def9226d3a62517c2db36f4f40b259aabfe9890db8806f4a7891e4f91236214963bdb10677b8928ca202c79500c88dc207ab057e75a38d799da41')
b2sums=('2fdbe4b1c7743952277f699a186197adedd851650ac37ec31292eabed32693611aa75fb207e57bc814c639905285fffe092008e887ae713f5d2f84c4d1c4831a'
        'ac740cdef10ce222c24b8482997a98444f7ba91ff3cf262e7b2415543b7ec6849575a6cbe46e45ebcb25a9e508802426487c325aedb480221c6738932421f72a')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-2.11.0-build_shared_libs.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,ChangeLog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
