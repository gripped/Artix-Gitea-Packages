# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules
pkgver=6.31.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL)
depends=(cmake)
makedepends=(python-requests
             python-sphinx
             qt6-tools)
optdepends=('python-pyxdg: to generate fastlane metadata for Android apps'
            'python-requests: to generate fastlane metadata for Android apps'
            'python-yaml: to generate fastlane metadata for Android apps')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        artix.patch)
sha256sums=('8f74af329e4c918358bfe54316f8cf4d530c28444595a3e2fb15075f72877f17'
            'SKIP'
            '65b541e9f4144adb7c7d3612071b66ebb811c59cef0a7712c1d92345044d618f')
            
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  # Artix stuff - don't delete it!
  patch -d $pkgname-$pkgver -Np1 -i ../artix.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HTML_DOCS=ON \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
