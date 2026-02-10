# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=zxing-cpp
pkgver=3.0.0
pkgrel=3
pkgdesc='An open-source, multi-format linear/matrix barcode image processing library implemented in C++'
arch=(x86_64)
url='https://github.com/zxing-cpp/zxing-cpp'
license=(Apache-2.0)
depends=(gcc-libs
         glibc
         zint)
makedepends=(cmake
             git
             libpng
             opencv
             qt6-base
             qt6-declarative
             qt6-multimedia
             stb)
checkdepends=(gtest)
optdepends=('qt6-multimedia: for ZXingQtCamReader')
source=(git+https://github.com/zxing-cpp/zxing-cpp#tag=v$pkgver
        system-stb.patch)
sha256sums=('072683b5dec4060f2abfb54f8b7da9db198406138895876831fc16dece6aee7a'
            'cc83c917902c3551ff0a4b7752baf895044d40901eba74678aeef19e236266f1')

prepare() {
  cd $pkgname
  patch -p1 -i ../system-stb.patch # Do not download stb at build time
  git cherry-pick -n 6c953c6f0b9893fdbec5e3f9d510b4e06ccd2265 # Fix broken headers
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DZXING_EXAMPLES=ON \
    -DZXING_UNIT_TESTS=ON \
    -DZXING_C_API=ON \
    -DZXING_USE_BUNDLED_ZINT=OFF \
    -DZXING_WRITERS=BOTH
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
