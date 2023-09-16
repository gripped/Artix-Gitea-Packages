# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules
pkgver=5.110.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
makedepends=(python-sphinx python-requests qt5-tools)
optdepends=('python-pyxdg: to generate fastlane metadata for Android apps'
            'python-requests: to generate fastlane metadata for Android apps'
            'python-yaml: to generate fastlane metadata for Android apps')
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        artix.patch)
sha256sums=('7746f5db3e230ee2485e603580cc4c7cec636c3258c0a909766fb281913f6438'
            'SKIP'
            '885013500e268f29dbeafd7a2c86f0ca58da382233a59bd69cc0fee1d66eb2ac')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  # Artix stuff - don't delete it!
  patch -d $pkgname-$pkgver -Np1 -i ../artix.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HTML_DOCS=ON \
    -DBUILD_QTHELP_DOCS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
