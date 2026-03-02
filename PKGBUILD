# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=pulseaudio-qt
pkgver=1.8.0
pkgrel=3
pkgdesc='Qt bindings for libpulse'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.1-only
         LGPL-3.0-only)
depends=(glibc
         libpulse
         libstdc++
         qt6-base)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/libraries/pulseaudio-qt/-/commit/f7d4918e.patch)
sha256sums=('37c054226359469abba8384c8945fd1ccdff1adf3084f76a81d28612e2852782'
            'SKIP'
            '6e71775fafdd4b0754a7130f3aa01fc9b6ace8c6102dc52f21ff3da6ea831afa')
validpgpkeys=(2D1D5B0588357787DE9EE225EC94D18F7F05997E  # Jonathan Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1) # Nicolas Fella <nicolas.fella@kdab.com>

prepare() {
# https://bugs.kde.org/show_bug.cgi?id=516975
  patch -d $pkgname-$pkgver -p1 < f7d4918e.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
