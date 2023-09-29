# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct
pkgver=0.9
pkgrel=2
pkgdesc='Qt 6 Configuration Utility'
arch=(x86_64)
url='https://github.com/trialuser02/qt6ct'
license=(BSD)
depends=(gcc-libs
         glibc
         qt6-base
         qt6-svg)
makedepends=(cmake
             qt6-tools)
source=(https://github.com/trialuser02/qt6ct/releases/download/$pkgver/qt6ct-$pkgver.tar.xz
        qt6ctplatformtheme_cpp.patch)
sha256sums=('0a9f00db7f9c2003b33fad1715cbf2a483bf50a99079b97bf8e5d0bdbd3392cd'
            'aca0e85220293ee46f16e63b6abf78471ea4972c278e2b1b4c72c9f5b37557db')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  # artist
  patch -Np1 -i "$srcdir"/qt6ctplatformtheme_cpp.patch
  cd "$srcdir"
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
